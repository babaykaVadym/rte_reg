import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/chat/contact_controller.dart';
import 'package:rte_cubit/services/consts.dart';

import 'chat_screens/contact_menu.dart';
import 'home_screen.dart';
import 'main_screens/contac_page.dart';
import 'main_screens/notification_screen.dart';
import 'main_screens/qr_code_screen.dart';
import 'main_screens/ticket_screen.dart';
import 'parson_draw/prof_draw.dart';

class HomePage extends StatefulWidget {
  int currentIndex;
  HomePage({this.currentIndex});
  static String routeName = "/";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactController controller;
  int countMess = 0;
  @override
  void initState() {
    // TODO: implement initState
    controller = Get.put<ContactController>(ContactController());
    controller.fetchContact();

    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        print(
            "messaging.getAPNSToken() ${messaging.getToken().then((value) => print(value))}");
        messaging.getToken().then((value) async {
          controller.tokenFMC.value = value;

          controller.sendTokenDevice(token: value);
        });
      });
    });
  }

  void changePage(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  Widget _getScreen() {
    switch (widget.currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return ContactPage();
      case 2:
        return QrCodeScreen();
      case 3:
        return TicketScreen();
      case 4:
        return ContactMenu();

      default:
        return HomeScreen();
    }
  }

  AppBar get _getAppBar {
    switch (widget.currentIndex) {
      case 0:
        return HomeScreen.appBar(context);
      case 1:
        return ContactPage.appBar(context);
      case 2:
        return QrCodeScreen.appBar(context);
      case 3:
        return TicketScreen.appBar(context);
      case 4:
        return ContactMenu.appBar(context);
      default:
        return AppBar(
          centerTitle: true,
          title: Container(
            height: 50,
            child: Image.asset('images/logo.png'),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Get.to(NotificationsScreen());
                })
          ],
        );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar,
        drawer: ProfilDraws(changePage),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: widget.currentIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.contact_page_outlined, size: 30),
            Icon(Icons.qr_code_scanner, size: 30),
            Icon(Icons.event, size: 30),
            // Badge(
            //     badgeContent:
            //         Obx(() => Text(controller.countMesseg.value.toString())),
            //     child: Icon(Icons.chat, size: 30)),
          ],
          color: kAppBarColot,
          buttonBackgroundColor: kAppBarColot,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              changePage(index);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: SafeArea(child: _getScreen()));
  }
}
