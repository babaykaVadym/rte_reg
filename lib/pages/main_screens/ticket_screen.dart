import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/pages/tiket/tickets_widgets.dart';
import 'package:rte_cubit/services/consts.dart';

import 'notification_screen.dart';

class TicketScreen extends GetView<TicketsController> {
  bool startB = true;

  static appBar(context) => AppBar(
        centerTitle: true,
        title: Text(
          "Билеты",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Get.to(NotificationsScreen());
              })
        ],
      );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GetX<TicketsController>(
        initState: (state) => Get.find<TicketsController>(),
        builder: (controller) {
          print(controller.ticketsList);
          if (startB) {
            if (controller.newTicketsList.isEmpty) {
              if (controller.byingTicketsList.isEmpty) {
                controller.btnNew.value = false;
                controller.btnOld.value = true;
                controller.btnBuy.value = false;
                controller.ints.value = 2;
                startB = false;
              } else {
                controller.btnNew.value = false;
                controller.btnOld.value = false;
                controller.btnBuy.value = true;
                controller.ints.value = 1;
                startB = false;
                //  controller.ticketsList.refresh();
              }
            } else {
              controller.btnNew.value = true;
              controller.btnOld.value = false;
              controller.btnBuy.value = false;
              controller.ints.value = 0;
              startB = false;
              //  controller.ticketsList.refresh();
            }
          }
          return controller.ticketsList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.btnNew.value = true;
                            controller.btnOld.value = false;
                            controller.btnBuy.value = false;
                            controller.ints.value = 0;
                            controller.ticketsList.refresh();
                          },
                          child: Text(
                            'Новые (${controller.newTicketsList.length})',
                            style: TextStyle(
                                fontSize: 17,
                                color: controller.btnNew.value
                                    ? kYellowColor
                                    : Colors.black),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              controller.btnNew.value = false;
                              controller.btnOld.value = false;
                              controller.btnBuy.value = true;
                              controller.ints.value = 1;
                              controller.ticketsList.refresh();
                            },
                            child: Text(
                              'Купленые (${controller.byingTicketsList.length})',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: controller.btnBuy.value
                                      ? kYellowColor
                                      : Colors.black),
                            )),
                        TextButton(
                            onPressed: () {
                              controller.btnNew.value = false;
                              controller.btnOld.value = true;
                              controller.btnBuy.value = false;
                              controller.ints.value = 2;
                              controller.ticketsList.refresh();
                            },
                            child: Text(
                              'Прошедшие (${controller.oldTicketsList.length})',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: controller.btnOld.value
                                      ? kYellowColor
                                      : Colors.black),
                            )),
                      ],
                    ),
                    Flexible(
                      child: ListView.builder(
                          itemCount: controller.ticketsList.length,
                          itemBuilder: (context, index) {
                            var now = new DateTime.now();
                            switch (controller.ints.value) {
                              case 0:
                                if (controller
                                        .ticketsList[index].status.status ==
                                    "new") {
                                  return TicketsWidgets(
                                    ticketModel: controller.ticketsList[index],
                                  );
                                }
                                break;
                              case 1:
                                if (controller
                                        .ticketsList[index]
                                        .event
                                        .registrationStart
                                        .millisecondsSinceEpoch >=
                                    now.millisecondsSinceEpoch) {
                                  if (controller
                                          .ticketsList[index].status.status !=
                                      "new") {
                                    return TicketsWidgets(
                                      ticketModel:
                                          controller.ticketsList[index],
                                    );
                                  }
                                }
                                break;
                              case 2:
                                if (controller
                                        .ticketsList[index]
                                        .event
                                        .registrationStart
                                        .millisecondsSinceEpoch <
                                    now.millisecondsSinceEpoch) {
                                  return TicketsWidgets(
                                    ticketModel: controller.ticketsList[index],
                                  );
                                }
                                break;
                            }
                          }),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
