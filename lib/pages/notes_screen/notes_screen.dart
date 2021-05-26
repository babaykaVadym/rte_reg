import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/pages/notes_screen/contact_db.dart';
import 'package:rte_cubit/services/consts.dart';

import 'event_db.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  EventController eventController = Get.find();
  UserController userController = Get.find();
  bool evBtn;
  bool usBtn;
  bool activScren;
  @override
  void initState() {
    if (!userController.contactDBList.isEmpty) {
      evBtn = false;
      usBtn = true;
      activScren = true;
      print(
          "userController.contactListNotestID.isEmpty ${userController.contactListNotestID.length}");
    } else if (!eventController.eventDBList.isEmpty) {
      evBtn = true;
      usBtn = false;
      activScren = false;
      print(
          "!eventController.event_id_db_List.isEmpty ${eventController.event_id_db_List.length}");
    } else {
      print("noooooooooooooooooooooooooooooo");
      evBtn = false;
      usBtn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Заметки",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      activScren = true;
                      usBtn = true;
                      evBtn = false;
                    });
                  },
                  child: Text(
                    "Пользователи",
                    style: TextStyle(
                        fontSize: 16,
                        color: usBtn ? kYellowColor : Colors.black),
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      activScren = false;
                      usBtn = false;
                      evBtn = true;
                    });
                  },
                  child: Text(
                    "Собития",
                    style: TextStyle(
                        fontSize: 16,
                        color: evBtn ? kYellowColor : Colors.black),
                  ))
            ],
          ),
          Expanded(
              child: activScren == null
                  ? Center(
                      child: Text("Отсутсвуют заметки"),
                    )
                  : activScren
                      ? ContactDB()
                      : EventDb()),
        ],
      ),
    );
  }
}
