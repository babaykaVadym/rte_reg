import 'package:flutter/material.dart';

import 'consts.dart';

final kDarkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: kYellowColor,
    ));

final kLightTheme = ThemeData(
  primaryIconTheme: IconThemeData(color: Colors.black),
  fontFamily: "Roboto",
  backgroundColor: kBackgroundColor,
  buttonColor: kYellowColor,
  appBarTheme: AppBarTheme(
    color: kAppBarColot,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: kTextColors),
    headline2: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: kTextColors),
    subtitle1: TextStyle(
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyText1: TextStyle(
      fontFamily: "Roboto",
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    caption: TextStyle(
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  ),
);
