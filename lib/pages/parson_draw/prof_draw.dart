import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/pages/enent/activnost/lenta_activnosti.dart';
import 'package:rte_cubit/pages/notes_screen/notes_screen.dart';
import 'package:rte_cubit/pages/parson_draw/personal_setings.dart';
import 'package:rte_cubit/pages/parson_draw/scan_scren/u_scanned.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class ProfilDraws extends GetView<UserController> {
  final changeIndex;
  ProfilDraws(this.changeIndex);

  Future<void> _logOut() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
    FlutterRestart.restartApp();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: GetX<UserController>(
                initState: (state) => Get.find<UserController>(),
                builder: (controller) {
                  var data = controller.UserD.value;
                  print(controller.UserD.value.id.toString());
                  return Column(
                    children: <Widget>[
                      Container(
                        color: kAppBarColot,
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
                                      backgroundColor: kYellowColor,
                                      heroTag: "notif",
                                      mini: true,
                                      child: Icon(
                                        Icons.notifications,
                                        color: kTextColors,
                                        size: 35,
                                      ),
                                      onPressed: () {}),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(PersonalSetings());
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          data.avatar,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
/*Image.network(data.avatar),*/
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    heroTag: "push",
                                    backgroundColor: kYellowColor,
                                    onPressed: () {
                                      changeIndex(4);
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.sms_failed_outlined,
                                      color: kTextColors,
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
                              '${data.firstName} ${data.lastName}',
                              style: Theme.of(context).textTheme.headline1,
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
                          Get.to(LentaActivnosti());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text('Контакты'),
                        onTap: () {
                          changeIndex(1);
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.bookmark_border_outlined),
                        title: Text('Заметки'),
                        onTap: () {
                          Get.to(NotesScreen());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Настройки профиля'),
                        onTap: () {
                          Get.to(PersonalSetings());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.history),
                        title: Text('История скаирования'),
                        onTap: () {
                          Get.to(UScnned());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info_outline_rounded),
                        title: Text('FAQ'),
                        onTap: () {},
                      ),
                    ],
                  );
                }),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'ВЫЙТИ ИЗ ПРОФИЛЯ',
              style: Theme.of(context).textTheme.subtitle1,
            ),
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
                },
              );

              AlertDialog alert = AlertDialog(
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset("images/logo.png"),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text("Вы уверенны что хотите выйти из профиля?"),
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
      ),
    );
  }
}
