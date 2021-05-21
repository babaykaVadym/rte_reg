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
                  : ListView.builder(
                      itemCount: controller.tiketUpgradeList.length,
                      itemBuilder: (context, index) {
                        var ticket = controller.tiketUpgradeList[index];
                        if (idTiket == ticket.tickets.id) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                Text("Доступные улучшения билета:"),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      });
            }),
      ),
    );
  }
}
