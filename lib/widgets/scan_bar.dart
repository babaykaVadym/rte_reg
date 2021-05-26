import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget snacBars({text, color, context, duration}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    duration: duration,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ],
    ),
    width: 280.0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ));
}
