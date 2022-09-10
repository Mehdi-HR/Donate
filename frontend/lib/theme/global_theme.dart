import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? fontFamily = GoogleFonts.poppins().fontFamily;


class GlobalTheme {
  static const Color black = Color(0xFF0A191E);
  static const Color darkGrey = Color(0xFF2F2E41);
  static const Color grey = Color(0xFF495566);

  static const Color lighterBlue = Color(0xFF48A2F5);
  static const Color blue = Color(0xFF2745C4);


  static const Color darkBlue = Color(0xff441DFC);
  static const Color lightBlue = Color(0xff4E81EB);
  static const Color appBarBlue = Color(0xFF2745C4);

  static const Color customErrorRed = Color(0xFFC5032B);

  static const Color customSurfaceWhite = Color(0xFFE5E5E5);
  //static const Color customSurfaceWhite = Color(0xFFFFFFFF);

  static const Color appBarWhite = Color(0xFFFFFFFF);

  static get globalTheme => ThemeData(
      //colorScheme: _customColorScheme,
      textTheme: const TextTheme(

        bodyText1: TextStyle(
          fontSize: 20,
          color: grey,
          fontWeight: FontWeight.w300,
          letterSpacing: 1,
        ),
        bodyText2: TextStyle(
          color: lighterBlue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),

        headline1: TextStyle(
          color: grey,
          fontSize: 34,
          fontWeight: FontWeight.w700,
          backgroundColor: customSurfaceWhite,
          letterSpacing: 1,

        ),
        headline2: TextStyle(
          color: black,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          backgroundColor: customSurfaceWhite,
          letterSpacing: 1,

        ),
        headline3: TextStyle(
          fontSize: 24,
          color: GlobalTheme.darkGrey,
          fontWeight: FontWeight.w500,
          backgroundColor: Colors.transparent,
          letterSpacing: 1,
        ),
        headline4: TextStyle(
          fontSize: 18,
          color: GlobalTheme.grey,
          fontWeight: FontWeight.w500,
          backgroundColor: Colors.transparent,
          letterSpacing: 1,
        ),
        headline5: TextStyle(
          fontSize: 22,
          color: GlobalTheme.black,
          fontWeight: FontWeight.w700,
          backgroundColor: Colors.transparent,
          letterSpacing: 1,
        ),
        button: TextStyle(
          color: GlobalTheme.appBarWhite,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        overline: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      ),

      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: appBarBlue,
        // This will control the "back" icon
        iconTheme: IconThemeData(color: appBarWhite),
        // This will control action icon buttons that locates on the right
        centerTitle: false,
        elevation: 5,
        titleTextStyle: TextStyle(
          color: appBarWhite,
          fontWeight: FontWeight.w500,
          fontSize: 22,
          letterSpacing: 1,
        ),
      ),
      backgroundColor: customSurfaceWhite,
  );
}
/*
const ColorScheme _customColorScheme = ColorScheme(
  primary: customMagenta50,
  secondary: Colors.amber,
  surface: customSurfaceWhite,
  background: customSurfaceWhite,
  error: customMagenta900,
  onPrimary: Colors.red,
  onSecondary: Colors.deepOrange,
  onSurface: customMagenta300,
  onBackground: customMagenta100,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);*/