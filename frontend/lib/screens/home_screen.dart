import 'package:carousel_slider/carousel_slider.dart';
import 'package:donate/screens/choose_account_screen.dart';
import 'package:donate/theme/global_theme.dart';
import 'package:donate/widgets/login/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = ['home1.png', 'home2.png', 'home3.png'];
  final List<String> titleList = ['Charities & Projects', 'In App Payment', 'Secure Transactions'];
  final List<String> textList = ['Find charities or nonprofit organisations based on your interest and donate effortlessly', 'Help is always needed and the fastest is the better for that we implemented in app payment', 'Make your transaction securely without any fear of your data stolen or exposed'];



  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    final List<Widget> imageSliders = imgList.asMap().entries.map((item) => Container(
      width: deviceWidth * 0.8,
      margin: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('assets/img/' + item.value),),
              SizedBox(
                  height: deviceHeight * 0.1,
              ),
              Text(
                titleList[item.key],
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Text(
                textList[item.key],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ))
        .toList();


    return Scaffold(
      backgroundColor: GlobalTheme.customSurfaceWhite,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                  viewportFraction: 1,
                    height: deviceHeight * 0.65,
                    autoPlayInterval: const Duration(seconds: 3),
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? GlobalTheme.grey
                              : GlobalTheme.blue)
                              .withOpacity(_current == entry.key ? 0.9 : 0.2)),
                    ),
                  );
                }).toList(),
              ),
                  SizedBox(height: deviceHeight * 0.05 ,)
            ]),
            RoundedButton(
                text: 'Sign in',
                press: () =>  Navigator.pushNamed(context, SignInScreen.namedRoute),),
            SizedBox(height: deviceHeight * 0.05 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account yet ?',
                  style: TextStyle(
                    fontSize: 20,
                    color: GlobalTheme.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context,ChooseAccountScreen.namedRoute),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20,
                      color: GlobalTheme.lighterBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}