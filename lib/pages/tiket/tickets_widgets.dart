import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/models/tickets_model.dart';
import 'package:rte_cubit/pages/tiket/ticket_menu_screen.dart';

class TicketsWidgets extends GetView<TicketsController> {
  final DatumData ticketModel;
  const TicketsWidgets({this.ticketModel});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => Container(
        height: 100,
        margin: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Get.to(TicketMenuScreen(
              ticketModel: ticketModel,
            ));
          },
          child: Row(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      ticketModel.event.logoUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(width: 20),
              Flexible(
                child: Column(
                  children: [
                    Text(
                        '${DateFormat('d/M/y - HH:mm').format(ticketModel.event.eventEnd)}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '#' + ticketModel.id.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ticketModel.event.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              ticketModel.event.address,
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
      ),
    );
  }
}
