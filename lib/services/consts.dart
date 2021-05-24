import 'dart:ui';

import 'package:flutter/material.dart';

const String kUrlApi = "https://a3.rte.im/api/v1/";
const String kUrlApiChat = "https://a.rte.im/";

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer ${Const.token}'
};

class Const {
  static bool activeBts = true;
  static String userMail;
  static String passwod;
  static String token;
  static int countNewT;
  static int countByingT;
  static int countOldT;
  static int UserID;
}

Color kYellowColor = Color(0xFFffd059);

Color kAppBarColot = Color(0xffe3eaf3);

Color kTextColors = Colors.black;
Color kBackgroundColor = Colors.white;
