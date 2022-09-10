import 'package:donate/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../theme/global_theme.dart';

class ChooseAccountScreen extends StatelessWidget{

  final String title;
  const ChooseAccountScreen({Key? key, required this.title}) : super(key: key);
  static const namedRoute = '/choose-account-type';
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(title),
    );
    final height = _mediaQuery.size.height -
        _mediaQuery.padding.top -
        appBar.preferredSize.height;
    final width = _mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Choose your',
                    style: TextStyle(
                      fontSize: 28,
                      color: GlobalTheme.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),                Text(
                    ' account ',
                    style: TextStyle(
                      fontSize: 28,
                      color: GlobalTheme.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),                Text(
                    'type',
                    style: TextStyle(
                      fontSize: 28,
                      color: GlobalTheme.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(0),
                width: width * 0.7,
                height: height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: const LinearGradient(
                    colors: [
                      GlobalTheme.darkBlue,
                      GlobalTheme.lightBlue,
                    ],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft,
                    tileMode: TileMode.repeated,
                    stops: [0.2, 0.5],
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  borderOnForeground: false,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      child: const ListTile(
                        title: Text(
                          "Donor",
                          style: TextStyle(
                            color: GlobalTheme.appBarWhite,
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        subtitle: Text(
                          "Account",
                          style: TextStyle(
                            color: GlobalTheme.appBarWhite,
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                          ),
                        ),
                        trailing: Icon(
                          Icons.account_circle,
                          color: GlobalTheme.customSurfaceWhite,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(0),
                width: width * 0.7,
                height: height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: const LinearGradient(
                    colors: [
                      GlobalTheme.blue,
                      GlobalTheme.lighterBlue,
                    ],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft,
                    tileMode: TileMode.repeated,
                    stops: [0.2, 0.5],
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  borderOnForeground: false,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      child: const ListTile(
                        title: Text(
                          "Association",
                          style: TextStyle(
                            color: GlobalTheme.appBarWhite,
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        subtitle: Text(
                          "Account",
                          style: TextStyle(
                            color: GlobalTheme.appBarWhite,
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                          ),
                        ),
                        trailing: Icon(
                          Icons.group,
                          color: GlobalTheme.customSurfaceWhite,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account ?',
                    style: TextStyle(
                      fontSize: 20,
                      color: GlobalTheme.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed:() =>  Navigator.pushNamed(context, SignInScreen.namedRoute),
                    child: const Text(
                      'Sign in',
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
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}