import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/chat/masseg_controller.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/models/chat_model/message_model.dart';
import 'package:rte_cubit/models/db/data_base_model.dart';
import 'package:rte_cubit/pages/chat_screens/chat_api.dart';
import 'package:rte_cubit/pages/contact_page/contact_data_helper.dart';
import 'package:rte_cubit/pages/contact_page/contact_db.dart';
import 'package:rte_cubit/pages/notes_screen/data_base_helper.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/services/getLoadNotif.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonScreen extends StatefulWidget {
  var data;

  PersonScreen({
    @required this.data,
  });

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  void addToDB({type, evet_id, post, userid}) async {
    var db = new DatabaseHelper();
    var coment = DataBaseMaodel(type, evet_id, post, userid);
    await db.saveUser(coment);
  }

  void addToSaveDB({userid}) async {
    var db = new ContactDatabaseHelper();
    var coment = ContactDataBaseMaodel(userid);
    await db.saveUser(coment);
  }

  void deletDB({id}) async {
    var db = new DatabaseHelper();
    await db.deleteUsersId(id);
  }

  void deletSaveDB({id}) async {
    var db = new ContactDatabaseHelper();
    await db.deleteUsers(id);
  }

  UserController userController = Get.find();

  MessegeController messegeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              !userController.contactListNotestID.value.contains(widget.data.id)
                  ? IconButton(
                      icon: Icon(
                        Icons.add_chart,
                      ),
                      onPressed: () async {
                        if (!userController.contactListNotestID.value
                            .contains(widget.data.id)) {
                          print(userController.contactDBList.value);
                          addToDB(
                              evet_id: 0,
                              post: 0,
                              type: "user",
                              userid: widget.data.id);

                          await GetLoadNotif().getId();
                          setState(() {
                            userController.contactListNotestID.refresh();
                          });
                          print(userController.contactDBList.value);
                        }
                      })
                  : IconButton(
                      icon: Icon(
                        Icons.delete_sweep_outlined,
                      ),
                      onPressed: () {
                        print(userController.contactDBList.value);
                        print(widget.data.id);
                        setState(() {
                          deletDB(id: widget.data.id);
                          userController.contactListNotestID
                              .remove(widget.data.id);
                          userController.contactDBList.remove(widget.data);
                          print(userController.contactDBList.value);
                          userController.contactDBList.refresh();
                          userController.contactListNotestID.refresh();
                          userController.UserD.refresh();
                        });
                        print(userController.contactDBList.value);
                        Get.back();
                      }),
              !userController.contactSaveListID.value.contains(widget.data.id)
                  ? IconButton(
                      icon: Icon(
                        Icons.group_add,
                      ),
                      onPressed: () async {
                        if (!userController.contactSaveListID.value
                            .contains(widget.data.id)) {
                          print(userController.contactSvaveDBList.value);
                          addToSaveDB(userid: widget.data.id);

                          await GetLoadNotif().getContactSaveDB();
                          setState(() {
                            userController.contactSaveListID.refresh();
                          });
                          print(userController.contactDBList.value);
                        }
                      })
                  : IconButton(
                      icon: Icon(
                        Icons.delete_forever_outlined,
                      ),
                      onPressed: () {
                        print(userController.contactSvaveDBList.value);
                        print(widget.data.id);
                        setState(() {
                          deletDB(id: widget.data.id);
                          userController.contactSaveListID
                              .remove(widget.data.id);
                          userController.contactSvaveDBList.remove(widget.data);
                          print(userController.contactSvaveDBList.value);
                          userController.contactSvaveDBList.refresh();
                          userController.contactSaveListID.refresh();
                          userController.UserD.refresh();
                        });
                      }),
            ],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(140),
                    child: // Icon(Icons.perm_identity),
                        Image.network(
                      widget.data.avatarUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '${widget.data.firstName} ${widget.data.lastName}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kYellowColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () async {
                  print("UserId ${widget.data.id}");
                  final messid = IdModel(id: widget.data.id);

                  messegeController.item.value = messid;
                  messegeController.id.value = widget.data.id;
                  await messegeController.fetchMessege();

                  Get.to(ChatApi(
                    firstName: widget.data.firstName,
                    lastNAme: widget.data.lastName,
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.maps_ugc,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Отправить сообщения',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),
            GestureDetector(
              onTap: () {
                launch(
                    "tel:${widget.data.telephoneCode + widget.data.telephoneNumber}");
              },
              child: Container(
                color: Colors.white,
                child: _textColum(
                    paramT:
                        widget.data.telephoneCode + widget.data.telephoneNumber,
                    nameT: 'Телефонный номер'),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch("mailto:${widget.data.email}");
              },
              child: Container(
                  color: Colors.white,
                  child:
                      _textColum(paramT: widget.data.email, nameT: 'e-mail')),
            ),
            widget.data.company == null
                ? Container()
                : _textColum(paramT: widget.data.company, nameT: 'Компания'),
            // _textColum(paramT: cityPerson, nameT: 'Position'),
          ],
        ),
      ),
    );
  }
}

Widget _textColum({String nameT, String paramT}) {
  return Column(
    children: [
      Text(
        nameT,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      Text(
        paramT,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      Divider(
        thickness: 3,
        indent: 10,
        endIndent: 10,
      ),
    ],
  );
}
