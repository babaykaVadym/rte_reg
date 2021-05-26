import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rte_cubit/pages/home_page.dart';
import 'package:rte_cubit/widgets/scan_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'consts.dart';
import 'load_script.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class LoginData {
  Future<bool> _isRegistered;

  loginData({mailUser, password, context}) async {
    final SharedPreferences prefs = await _prefs;

    /*var response = await http.put(Uri.parse(kUrlApi + 'auth'),
        body: {'email': mailUser, 'password': password});
*/

    var response = await http.put(Uri.parse('https://a.rte.im/api/v1/auth'),
        body: {'email': mailUser, 'password': password});

    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);
      Const.token = jsonData['access_token'];
      print("tokent  = ${Const.token}");
      if (Const.token != null) {
        prefs.setString('usernamee', mailUser);
        prefs.setString('passwordd', password);
        snacBars(
            color: Colors.green,
            text: "Успешный вход. Подождите",
            context: context,
            duration: Duration(milliseconds: 1200));
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
      snacBars(
          color: Colors.red,
          text: "Логин или пароль неверный",
          context: context,
          duration: Duration(milliseconds: 1200));
    }
  }
}
