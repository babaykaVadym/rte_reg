import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rte_cubit/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'consts.dart';
import 'load_script.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class LoginData {
  Future<bool> _isRegistered;

  Future<String> loginData({mailUser, password, key}) async {
    final SharedPreferences prefs = await _prefs;
    print('usernamess2  $mailUser');
    print('passwordss2  $password');

    var response = await http.put(Uri.parse(kUrlApi + 'auth'),
        body: {'email': mailUser, 'password': password});

    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);
      Const.token = jsonData['access_token'];

      if (Const.token != null) {
        prefs.setString('usernamee', mailUser);
        prefs.setString('passwordd', password);
        snacBar(
            key: key, color: Colors.green, text: "Успешный вход. Подождите");
        await LoadScrepss().RunTikets();
        Get.off(HomePage(
          currentIndex: 0,
        ));
        _isRegistered =
            prefs.setBool("Registeredss", true).then((bool success) {
          return _isRegistered;
        });
      }
    } else {
      Const.activeBts = true;
      snacBar(key: key, color: Colors.red, text: "Логин или пароль неверный");
    }
  }

  void snacBar({text, key, color}) {
    key.currentState.showSnackBar(SnackBar(
        backgroundColor: color,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ],
        )));
  }
}
