import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rte_cubit/services/login_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screens.dart';
import 'no_internet_screen.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class SplashScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    bool isInternetAvalibe = true;

    _checkInternetAvailability().then((value) {}).catchError((_) {
      isInternetAvalibe = false;
    });

    Future.delayed(const Duration(seconds: 1), () {
      _getRegistrationStatus().then((isRegistered) {
        if (!isInternetAvalibe) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return NoInternetScreen();
          }));
        } else if (isRegistered) {
          LogindsData(context);
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return LoginScreens();
          }));
        }
      }).catchError((printError) {
        print(printError);
      });
    });
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * .3,
            left: 0,
            right: 0,
            child: Center(
              child: new Image.asset(
                'images/logo.png',
                width: MediaQuery.of(context).size.width * .5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Platform.isIOS
                ? CupertinoActivityIndicator()
                : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  Future<bool> LogindsData(context) async {
    final SharedPreferences prefs = await _prefs;

    String log = await prefs.getString('usernamee');
    String pss = await prefs.getString('passwordd');

    await LoginData().loginData(password: pss, mailUser: log, key: scaffoldKey);
  }

  Future<bool> _getRegistrationStatus() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getBool('Registeredss') ?? false;
  }

  Future<bool> _checkInternetAvailability() async {
    final result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      throw "No internet";
    }
  }
}
