import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/event_controller.dart';

import '../event_screens.dart';

class LentaActivnosti extends StatelessWidget {
  EventController eventController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Лента активности",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: eventController.oldEventList.length,
          itemBuilder: (context, index) {
            var event = eventController.oldEventList[index];

            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: GestureDetector(
                onTap: () {
                  eventController.page.value = 1;
                  eventController.eventListComs.clear();
                  eventController.fetchEventsComent(event.id);

                  Get.to(EventsScrents(
                    event_id: event.id,
                  ));
                },
                child: Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 75,
                        width: 160,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            event.logo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            event.title,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(event.description),
                          Text(DateFormat('d/M/y').format(event.eventStart)),
                          Text(event.address)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
