import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/chat/masseg_controller.dart';
import 'package:rte_cubit/models/chat_model/message_model.dart';
import 'package:rte_cubit/pages/chat_screens/chat_api.dart';

class PersonScreen extends StatelessWidget {
  String namePerson;
  String nameSecPerson;
  String mailPerson;
  String telephone, company;

  int UserId;
  PersonScreen(
      {@required this.namePerson,
      @required this.mailPerson,
      @required this.telephone,
      @required this.company,
      @required this.UserId,
      @required this.nameSecPerson});
  MessegeController messegeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.article_outlined,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.add_chart,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.perm_contact_cal_outlined,
                  ),
                  onPressed: null)
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
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 45,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '$namePerson $nameSecPerson',
                style: TextStyle(
                  fontSize: 16,
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
                color: Colors.black26,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                onPressed: () async {
                  print("UserId $UserId");
                  final messid = IdModel(id: UserId);

                  messegeController.item.value = messid;
                  messegeController.id.value = UserId;
                  await messegeController.fetchMessege();

                  Get.to(ChatApi(
                    firstName: namePerson,
                    lastNAme: nameSecPerson,
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.maps_ugc),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Person Masseg'),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),
            _textColum(paramT: telephone, nameT: 'Telephone'),
            _textColum(paramT: mailPerson, nameT: 'e-mail'),
            _textColum(paramT: company, nameT: 'company'),
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
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        paramT,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      Divider(
        thickness: 3,
        indent: 10,
        endIndent: 10,
      ),
    ],
  );
}
