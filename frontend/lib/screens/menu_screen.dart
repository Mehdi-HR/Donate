
import 'package:donate/dummy_data.dart';
import 'package:donate/widgets/menu/project_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/global_theme.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);
  final String username = 'Mehdi';
  static const namedRoute = '/menu_screen';


  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    
    final appBar1 = AppBar(
      toolbarHeight: _mediaQuery.size.height * 0.2,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children : [
              const Text(
                'Hello ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  fontSize: 24,

                ),
              ),
              Text(
                  widget.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    fontSize: 24,
                  ),
              ),
            ],
          ),
          SizedBox(height: _mediaQuery.size.height * 0.01,),
          const Text(
            'Ready to make a change the world ?\nDonate to your favorite charity now !',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: Color.fromRGBO(255, 255, 255, 0.8),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );



    final appBar2 = AppBar(
      toolbarHeight: _mediaQuery.size.height * 0.2,
      //title: SearchBar,
    );
    final height = _mediaQuery.size.height -
        _mediaQuery.padding.top -
        appBar1.preferredSize.height;
    final width = _mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar1,
      body: Center(
        child: Container(
          width: _mediaQuery.size.width * 0.9,
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: const[
                  Text(
                    "Projects ",
                    style: TextStyle(
                      fontSize: 24,
                      color: GlobalTheme.darkGrey,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.transparent,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "you follow ",
                    style: TextStyle(
                      fontSize: 24,
                      color: GlobalTheme.darkGrey,
                      backgroundColor: Colors.transparent,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: _mediaQuery.size.height  * 0.02,),
              Expanded(
                child: ListView.builder(
                  itemCount: DummyData.projects.length,
                  itemBuilder: (ctx, i) => ProjectCard(DummyData.projects[i])
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
          backgroundColor: Colors.transparent,
          fontSize: 16,
        ),
        iconSize: 28,
        selectedLabelStyle: const TextStyle(
          backgroundColor: Colors.transparent,
          fontSize: 16,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.transparent,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: GlobalTheme.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
