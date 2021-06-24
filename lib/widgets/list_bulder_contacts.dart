import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/pages/parson_draw/person_screen.dart';

class ListBuilContacts extends StatelessWidget {
  var data;

  ListBuilContacts({this.data});

  EventController eventController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PersonScreen(
              data: data,
            );
          }));
        },
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width / 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: // Icon(Icons.perm_identity),
                    Image.network(
                  data.avatarUrl,
                  fit: BoxFit.cover,
                ),
              ),
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
                            data.telephoneCode + data.telephoneNumber,
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
