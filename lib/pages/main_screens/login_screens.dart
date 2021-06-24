import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/services/login_data.dart';
import 'package:rte_cubit/widgets/scan_bar.dart';

class LoginScreens extends StatefulWidget {
  @override
  _LoginScreensState createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  bool _hidePass = true;
  final loadingScreenKey = GlobalKey();
  String mailUser;
  String password;

  readValues() {
    try {
      if (password.length > 3 && mailUser.contains('@') == true) {
        print("ыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыы");
        conect();
      } else {
        print("ыыиииииииииииииииииииииииииииииииииииииииииииии");
        snacBars(
            color: Colors.red,
            context: context,
            text: "Логин или пароль неверный",
            duration: Duration(milliseconds: 1200));

        Timer(Duration(milliseconds: 800), () {
          setState(() {
            Const.activeBts = true;
          });
        });
      }
    } catch (e) {
      snacBars(
          color: Colors.red,
          context: context,
          text: "Логин или пароль неверный",
          duration: Duration(milliseconds: 1200));

      Timer(Duration(milliseconds: 1500), () {
        setState(() {
          Const.activeBts = true;
        });
      });
    }
  }

  conect() {
    Timer(Duration(milliseconds: 4000), () {
      setState(() {
        Const.activeBts = true;
      });
    });
    LoginData()
        .loginData(mailUser: mailUser, password: password, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: loadingScreenKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height / 3,
                  child: Image.asset('images/logo.png'),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.alternate_email),
                      hintText: 'Enter Login',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (value) {
                      mailUser = value;
                      print(mailUser);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(_hidePass
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _hidePass = !_hidePass;
                          });
                        },
                      ),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    obscureText: _hidePass,
                    onChanged: (value) {
                      password = value;
                      print(password);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Const.activeBts
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height / 2.23),
                          color: kYellowColor,
                        ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          child: Text(
                            "Войти",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              Const.activeBts = false;
                              Timer(Duration(milliseconds: 800), () {
                                setState(() {
                                  Const.activeBts;
                                });
                              });
                            });
                            readValues();
                          },
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height / 2.23),
                          color: kAppBarColot,
                        ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          child: Text(
                            "Войти",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.height / 2.23,
                  child: Image.asset('images/headerImg.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
