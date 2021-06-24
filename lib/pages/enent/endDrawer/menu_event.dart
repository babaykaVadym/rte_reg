import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/chat/masseg_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/models/chat_model/message_model.dart';
import 'package:rte_cubit/pages/chat_screens/chat_api.dart';
import 'package:rte_cubit/pages/enent/endDrawer/event_id_contact.dart';
import 'package:rte_cubit/pages/enent/endDrawer/video_event.dart';

import 'event_contact.dart';

class EndDrawerMenu extends StatelessWidget {
  MessegeController messegeController = Get.find();
  UserController userController = Get.find();
  var eventIdModel;
  int event_id;
  EndDrawerMenu({this.event_id, this.eventIdModel});
  EventController eventController = Get.find();
  @override
  Widget build(BuildContext context) {
    userController.getUserId(eventIdModel.organizer);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width * 0.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                eventIdModel.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            eventIdModel.title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Html(data: eventIdModel.description),
          Divider(
            thickness: 2,
            color: Colors.grey[200],
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('Локация'),
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Локация'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              textBuld(
                                  name: "Место проведения:",
                                  param: eventIdModel.locationName),
                              textBuld(
                                  name: "Адресс:", param: eventIdModel.address),
                              textBuld(
                                  name: "Начало регистрации:",
                                  param: DateFormat('d/M/y - HH:mm')
                                      .format(eventIdModel.registrationStart)),
                              textBuld(
                                  name: "Регистрация заканчивается:",
                                  param: DateFormat('d/M/y - HH:mm')
                                      .format(eventIdModel.registrationEnd)),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        )
                      ],
                    );
                  });
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Учасники'),
            onTap: () async {
              eventController.pageContact.value = 1;
              await eventController.fetchEventContact(event_id);
              Get.to(EventContact());
              // Navigator.pushNamed(context, ProfileSettingsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt_outlined),
            title: Text('Спикеры'),
            onTap: () {
              print("ssssssssssssadadasd ${eventIdModel.speakers.data.length}");
              Get.to(EventIdContact(eventIdModel.speakers));
            },
          ),
          eventIdModel.domain == null
              ? Container()
              : ListTile(
                  leading: Icon(Icons.library_add_check),
                  title: Text('Программа'),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: const Text('Программа'),
                            children: <Widget>[
                              Html(
                                  data: eventIdModel.domain.programHtml == null
                                      ? ""
                                      : eventIdModel.domain.programHtml),
                            ],
                          );
                        });
                    // Navigator.pushNamed(context, ProfileSettingsScreen.routeName);
                  },
                ),
          //   Text(eventIdModel.domain.programHtml.toString()),

          eventIdModel.domain == null
              ? Container()
              : ListTile(
                  leading: Icon(Icons.ondemand_video),
                  title: Text(eventIdModel.domain.youtubeTitle),
                  onTap: () {
                    eventIdModel.domain.youtube == null
                        ? print("null")
                        : Get.to(VideoEvemt(
                            name: eventIdModel.domain.youtubeTitle,
                            url: eventIdModel.domain.youtube));
                  },
                ),
          eventIdModel.domain == null
              ? Container()
              : ListTile(
                  leading: Icon(Icons.social_distance_outlined),
                  title: Text(eventIdModel.domain.socialTitle),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: const Text('Наши контакты'),
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    width:
                                        MediaQuery.of(context).size.width / 5.5,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            "images/logo/facebook-logo.png")),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    width:
                                        MediaQuery.of(context).size.width / 5.5,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            "images/logo/instagram.png")),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    width:
                                        MediaQuery.of(context).size.width / 5.5,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            "images/logo/1024px-Telegram_logo.svg.png")),
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                ),

          ListTile(
            leading: Icon(Icons.message),
            title: Text('Написать организатору'),
            onTap: () async {
              final messid = IdModel(id: eventIdModel.organizer);

              messegeController.item.value = messid;
              messegeController.id.value = eventIdModel.organizer;
              await messegeController.fetchMessege();

              Get.to(ChatApi(
                firstName: userController.userId.value.firstName,
                lastNAme: userController.userId.value.lastName,
              ));
              print("OOO ${userController.userId.value.lastName}");
            },
          ),
        ],
      ),
    );
  }
}

Widget textBuld({name, param}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Text(
            param,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      SizedBox(
        height: 8,
      ),
    ],
  );
}
