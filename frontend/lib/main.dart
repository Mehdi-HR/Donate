import 'package:donate/screens/menu_screen.dart';
import 'package:donate/screens/project_screen.dart';
import 'package:donate/screens/sign_in_screen.dart';

import 'screens/choose_account_screen.dart';
import 'screens/home_screen.dart';
import 'theme/global_theme.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donate',
      theme: GlobalTheme.globalTheme,
      initialRoute: MenuScreen.namedRoute,
      routes: {
        '/': (ctx) => const HomeScreen(),
        ChooseAccountScreen.namedRoute : (ctx) => const ChooseAccountScreen(title: 'Sign up'),
        SignInScreen.namedRoute : (ctx) => const SignInScreen(title: 'Sign In'),
        MenuScreen.namedRoute : (ctx) => const MenuScreen()
      },
    );
  }
}


