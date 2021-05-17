import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/pages/enent/activnost/lenta_activnosti.dart';
import 'package:rte_cubit/pages/parson_draw/personal_setings.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/user_image_widgets.dart';

class ProfilDraws extends GetView<UserController> {
  final changeIndex;
  ProfilDraws(this.changeIndex);

  @override
  Widget build(BuildContext context) {
    //  controller.fetchUserLogo();
    return Drawer(
        child: controller.obx(
      (data) => Column(
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
                      UserImageWidgets(),
                      /*Image.network(data.avatar),*/
                      SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        mini: true,
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
              Get.to(LentaActivnosti());
              //Navigator.pushNamed(context, TimetableScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Контакты'),
            onTap: () {
              changeIndex(1);
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
              Get.to(PersonalSetings());
              /* Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return ProfileSettingsScreen(widget.userModel);
              }));*/
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
                  // _logOut();
                },
              );

              AlertDialog alert = AlertDialog(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                        radius: 20, child: Image.asset("images/logo.png")),
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
    ));
  }
}