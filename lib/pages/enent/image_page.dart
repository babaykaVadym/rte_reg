import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePage extends StatelessWidget {
  String urll;
  ImagePage({this.urll});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image.network(
          urll,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
