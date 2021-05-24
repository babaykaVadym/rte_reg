import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/ticket/ticket_upgrade_controller.dart';

class TicketUpgrade extends GetView<TicketUpgrateController> {
  int idTiket;
  TicketUpgrade({this.idTiket});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Улучшить билет",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        child: GetX<TicketUpgrateController>(
            initState: (state) => Get.find<TicketUpgrateController>(),
            builder: (controller) {
              return controller.tiketUpgradeList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller.tiketUpgradeList.length,
                              itemBuilder: (context, index) {
                                var ticket = controller.tiketUpgradeList[index];
                                if (idTiket == ticket.tickets.id) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Билет ${ticket.tickets.schema.title} #${ticket.tickets.id}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Доступные улучшения билета:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        ticket.ticketSchemaUpgrade.isEmpty
                                            ? Text(
                                                "На данный момент нет доступных апгрейдов",
                                                style: TextStyle(fontSize: 18))
                                            : Column(
                                                children: [
                                                  tabOption("Улучшить до"),
                                                  Table(
                                                    border: TableBorder.all(
                                                        color: Colors.black),
                                                    children:
                                                        (ticket.ticketSchemaUpgrade
                                                                as List)
                                                            .map((item) =>
                                                                TableRow(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                              item.title,
                                                                              style: TextStyle(fontSize: 18)),
                                                                        ],
                                                                      ),

                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                              item.price,
                                                                              style: TextStyle(fontSize: 18)),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Switch(
                                                                              value: item.activeBtnSchema.value,
                                                                              onChanged: (value) {
                                                                                print(item.id);
                                                                                item.activeBtnSchema.value = value;
                                                                                controller.tiketUpgradeList.refresh();
                                                                              })
                                                                        ],
                                                                      ),
                                                                      //Text(item['place']),
                                                                      // you can have more properties of course
                                                                    ]))
                                                            .toList(),
                                                  ),
                                                ],
                                              ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Доступные дополнительные опции:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        ticket.optionUpgrades.isEmpty
                                            ? Text(
                                                "На данный момент нет действующих дополнительных опций",
                                                style: TextStyle(fontSize: 18))
                                            : Column(
                                                children: [
                                                  tabOption("Опция"),
                                                  Table(
                                                    border: TableBorder.all(
                                                        color: Colors.black),
                                                    children:
                                                        (ticket.optionUpgrades
                                                                as List)
                                                            .map((item) =>
                                                                TableRow(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                              item.option,
                                                                              style: TextStyle(fontSize: 18)),
                                                                        ],
                                                                      ),

                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                              item.price,
                                                                              style: TextStyle(fontSize: 18)),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Switch(
                                                                              value: item.activeBtn.value,
                                                                              onChanged: (value) {
                                                                                print(item.id);
                                                                                item.activeBtn.value = value;
                                                                                controller.tiketUpgradeList.refresh();
                                                                              })
                                                                        ],
                                                                      ),
                                                                      //Text(item['place']),
                                                                      // you can have more properties of course
                                                                    ]))
                                                            .toList(),
                                                  ),
                                                ],
                                              ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        ),
                      ],
                    );
            }),
      ),
    );
  }
}

Widget tabOption(name) {
  return Table(
    border: TableBorder.all(color: Colors.black),
    children: [
      TableRow(children: [
        Container(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Цена",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "",
              ),
            ],
          ),
        )
      ]),
    ],
  );
}
