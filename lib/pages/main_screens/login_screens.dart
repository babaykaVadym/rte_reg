import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/services/login_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class LoginScreens extends StatefulWidget {
  @override
  _LoginScreensState createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  bool _hidePass = true;
  Future<bool> _isRegistered;
  String mailUser;
  String password;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  readValues() {
    if (password.length > 3 && mailUser.contains('@') == true) {
      conect();
    } else {
      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Логин или пароль неверный")));
    }
  }

  conect() async {
    await LoginData()
        .loginData(mailUser: mailUser, password: password, key: scaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                Container(
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
                      readValues();
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
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
