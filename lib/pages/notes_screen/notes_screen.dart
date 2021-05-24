import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/event_controller.dart';

import 'event_db.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  EventController eventController = Get.find();

  @override
  void initState() {}

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
          Expanded(child: EventDb()),
        ],
      ),
    );
  }
}
