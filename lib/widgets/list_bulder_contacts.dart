import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/pages/parson_draw/person_screen.dart';
import 'package:rte_cubit/widgets/user_image_widgets.dart';

class ListBuilContacts extends StatelessWidget {
  var data;

  ListBuilContacts({this.data});

  EventController eventController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PersonScreen(
              namePerson: data.firstName,
              mailPerson: data.email,
              /* cityPerson: data.position,*/
              telephone: data.telephoneFullNumber,
              company: data.company,
              UserId: data.id,
              nameSecPerson: data.lastName,
            );
          }));
        },
        child: Row(
          children: [
            data.id == eventController.UserId.value
                ? UserImageWidgets()
                : Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 35,
                        )),
                  ),
            SizedBox(width: 20),
            Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data.firstName + " " + data.lastName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            data.telephoneFullNumber,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
