import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class UserImageWidgets extends StatefulWidget {
  static Uint8List bytes;

  @override
  _UserImageWidgetsState createState() => _UserImageWidgetsState();
}

class _UserImageWidgetsState extends State<UserImageWidgets> {
  File logo;
  Uint8List bytes2;
  int i = 2;

  Future LoadImg() async {
    final SharedPreferences prefs = await _prefs;
    String _imgString = await prefs.getString("img64");

    UserImageWidgets.bytes = Base64Decoder().convert(_imgString);
  }

  @override
  Widget build(BuildContext context) {
    return UserImageWidgets.bytes == null
            ? CircleAvatar(
                child: Icon(
                  Icons.account_circle_rounded,
                  color: kYellowColor,
                  size: 35,
                ),
                backgroundColor: kAppBarColot,
                maxRadius: 35,
                minRadius: 20,
              )
            : CircleAvatar(
                backgroundImage: MemoryImage(UserImageWidgets.bytes),
                maxRadius: 30,
                minRadius: 20,
              )

        /*CircleAvatar(
                child: Image.memory(bytes),
              )*/ /*new CircleAvatar(
            backgroundImage: new FileImage(logo),
            maxRadius: 30,
            minRadius: 20,
          )*/
        ;
  }
}
