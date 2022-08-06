import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: boxItemColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    canvasColor: greyContentColor,
    textTheme: TextTheme(
        headline5: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: GoogleFonts.inter().fontFamily,
            letterSpacing: 0.5),
        headline4: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              letterSpacing: 0.5,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
        bodyText1: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              letterSpacing: 0.5,
              fontFamily: GoogleFonts.inter().fontFamily,
            )),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      titleTextStyle: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(color: kContentColorLightTheme),
      contentTextStyle:
          Theme.of(context).textTheme.bodyText2!.copyWith(color: kAccentColor),
    ),
    hoverColor: Colors.grey[200],
    colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
        background: Colors.white,
        onPrimary: bgColor),
    dialogBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
    )),
    inputDecorationTheme: const InputDecorationTheme(
        helperStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.007,
            color: boxItemColor),
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.007,
            color: boxItemColor),
        labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.007,
            color: boxItemColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        )),
  );
}

const appBarTheme = AppBarTheme(
    centerTitle: false, elevation: 0, backgroundColor: lightModeBackgroundClr);

var darkAppBarTheme = const AppBarTheme(
    centerTitle: false, elevation: 0, backgroundColor: Colors.black);
