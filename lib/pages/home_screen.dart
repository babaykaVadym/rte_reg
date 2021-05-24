import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/pages/tiket/ticket_menu_screen.dart';
import 'package:rte_cubit/services/getLoadNotif.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import 'enent/event_screens.dart';
import 'main_screens/notification_screen.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class HomeScreen extends StatefulWidget {
  static appBar(context) => AppBar(
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
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TicketsController ticketsController = Get.find();
  EventController eventController = Get.find();

  @override
  void initState() {
    GetLoadNotif().getId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  drawer: ProfilDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (ticketsController.isLoading.value &&
                  eventController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 40,
                        width: 150,
                        child: SfBarcodeGenerator(
                          value: eventController.UserId.value.toString(),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    eventController.eventListM.isEmpty
                        ? Container()
                        : Column(
                            children: [
                              Text("Текущие собития:"),
                              _eventWidg(eventController.eventListM),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    ticketsController.newTicketsList.isEmpty
                        ? Container()
                        : Column(
                            children: [
                              Text("Новые билеты:"),
                              _eventWidg(ticketsController.newTicketsList),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    ticketsController.byingTicketsList.isEmpty
                        ? Container()
                        : Column(
                            children: [
                              Text("Оплаченные билеты:"),
                              _eventWidg(ticketsController.byingTicketsList),
                            ],
                          ),
                    ticketsController.newTicketsList.isEmpty
                        ? ticketsController.byingTicketsList.isEmpty
                            ? Container(
                                child: Center(
                                  child: Text("Нет новых билетов"),
                                ),
                              )
                            : Container()
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  _eventWidg(data) {
    return Container(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            var article = data[index];
            var formattedTime = DateFormat('d/M/y - HH:mm').format(
                data.toString().contains("EventIdModel")
                    ? article.registrationStart
                    : article.event.registrationStart);

            return Container(
              height: 110,
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () async {
                  if (data.toString().contains("EventIdModel")) {
                    eventController.page.value = 1;
                    await eventController.eventListComs.clear();
                    await eventController.fetchEventsComent(article.id);

                    Get.to(EventsScrents(
                      event_id: article.id,
                      eventModel: eventController.eventListM[index],
                    ));
                  }
                  if (data.toString().contains("DatumData")) {
                    Get.to(TicketMenuScreen(
                      ticketModel: article,
                    ));
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          data.toString().contains("EventIdModel")
                              ? article.logo
                              : article.event.logoUrl,
                          width: 140,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black26,
                        ),
                        width: 140,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.toString().contains("EventIdModel")
                                  ? article.title
                                  : article.event.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              formattedTime,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
