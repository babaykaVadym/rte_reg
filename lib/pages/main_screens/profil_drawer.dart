import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilDrawer extends StatefulWidget {
  ProfilDrawer(this.changeIndex);
  final changeIndex;

  @override
  _ProfilDrawerState createState() => _ProfilDrawerState();
}

class _ProfilDrawerState extends State<ProfilDrawer> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _load = true;
  Future<bool> _isRegistered;
  UserController userController = Get.find();
  @override
  void initState() {
    _load = false;

    // TODO: implement initState
    super.initState();
  }

  Future<void> _logOut() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('toke', null);
    print(prefs.getString('toke'));
    _isRegistered = prefs.setBool("isRegistered", false).then((bool success) {
      return _isRegistered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: _load
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : /*FutureBuilder<UserModel>(
              future: widget
                  .userModel, // a previously-obtained Future<String> or null
              builder: (context, snapshot) {
                var profile = snapshot.data;
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Container(
                        color: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                      child: Icon(
                                        Icons.notifications,
                                        size: 30,
                                      ),
                                      onPressed: () {}),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 45,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    onPressed: null,
                                    child: Icon(
                                      Icons.sms_failed_outlined,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${profile.firstName} ${profile.lastName}',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.search_rounded,
                              size: 30,
                            ),
                            hintText: 'Поиск:',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.wifi),
                        title: Text('Лента активности'),
                        onTap: () {
                          Navigator.pop(context);
                          //Navigator.pushNamed(context, TimetableScreen.routeName);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text('Контакты'),
                        onTap: () {
                          widget.changeIndex(1);
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, ProfileSettingsScreen.routeName);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.bookmark_border_outlined),
                        title: Text('Заметки'),
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, FAQScreen.routeName);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Настройки профиля'),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProfileSettingsScreen(widget.userModel);
                          }));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info_outline_rounded),
                        title: Text('FAQ'),
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, FAQScreen.routeName);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('ВЫЙТИ ИЗ ПРОФИЛЯ'),
                        onTap: () {
                          Widget cancelButton = TextButton(
                            child: Text("отменить"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                          Widget continueButton = TextButton(
                            child: Text("выйти"),
                            onPressed: () {
                              _logOut();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return SplashScreen();
                              }));
                            },
                          );

                          AlertDialog alert = AlertDialog(
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    child: Image.asset("images/logo.png")),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: Text(
                                      "Вы уверенны что хотите выйти из профиля?"),
                                )
                              ],
                            ),
                            // content: ,
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                      ),
                    ],
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),*/
            Text("sss"));
  }
}
