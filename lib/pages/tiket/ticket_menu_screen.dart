import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/ticket/ticket_upgrade_controller.dart';
import 'package:rte_cubit/controllers/ticket/tiket_dop_controler.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/models/tickets_model.dart';
import 'package:rte_cubit/pages/tiket/tiket_menu/load_dop_material.dart';
import 'package:rte_cubit/pages/tiket/tiket_menu/ticket_upgrad_screen.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import 'tikets_person_seting.dart';

class TicketMenuScreen extends StatefulWidget {
  DatumData ticketModel;
  TicketMenuScreen({this.ticketModel});
  @override
  _TicketMenuScreenState createState() => _TicketMenuScreenState();
}

class _TicketMenuScreenState extends State<TicketMenuScreen> {
  TicketsController ticketsController = Get.find();
  TicketUpgrateController ticketUpgrateController = Get.find();
  TicketDopController ticketdop = Get.find();
  var expansionItem;
  void _getParam() {
    for (int i = 0; i < widget.ticketModel.tickets.length + 1; i++) {
      expansionItem = List<ExpansionItem>.generate(
          i,
          (i) => ExpansionItem(
                id: widget.ticketModel.tickets[i].holder.id.toString(),
                name: widget.ticketModel.tickets[i].holder.firstName +
                    " " +
                    widget.ticketModel.tickets[i].holder.lastName,
                phone: widget.ticketModel.tickets[i].holder.telephoneNumber,
                email: widget.ticketModel.tickets[i].holder.email,
                hash: widget.ticketModel.tickets[i].hash,
                tiket_id: int.parse(widget.ticketModel.id),
                event_id: widget.ticketModel.event.id,
                tiket: widget.ticketModel.tickets[i],
              ));
    }
  }

  @override
  void initState() {
    print(widget.ticketModel.id);

    _getParam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Номер заказа №${widget.ticketModel.id} ',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            /*Text(
              'Номер заказа #${widget.ticketModel.id}',
              style: TextStyle(fontSize: 20),
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 8.5,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.ticketModel.event.logoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        _text('Название:  '),
                        Text(
                          widget.ticketModel.event.title,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        _text(DateFormat('dd MMM - HH:mm')
                            .format(widget.ticketModel.event.eventStart)),
                        _text('Контактный номер: '),
                        Text(
                          widget.ticketModel.creator.telephoneFullNumber,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        _text("Почта: "),
                        Text(
                          widget.ticketModel.creator.email,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: ListView(
                children: [
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        expansionItem[index].isExpanded = !isExpanded;
                      });
                    },
                    children: [
                      ...expansionItem.map(
                        (value) => _buildFaqRow(
                            value,
                            context,
                            ticketsController,
                            widget.ticketModel,
                            ticketdop,
                            ticketUpgrateController),
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

ExpansionPanel _buildFaqRow(ExpansionItem item, context, ticketsController,
    ticketModel, ticketdop, ticketUpgrateController) {
  return ExpansionPanel(
    canTapOnHeader: true,
    headerBuilder: (BuildContext context, bool isExpanded) {
      return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Билет  №',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
              // style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(item.hash)
          ],
        ),
      );
    },
    body: Container(
      margin: EdgeInsets.only(bottom: 24, left: 8, right: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: SfBarcodeGenerator(
                  value:
                      'https://a.rte.im/#/event/${item.event_id}/orders/${item.tiket_id}/checkin/checkin-card/${item.hash}',
                  symbology: QRCode(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'ФИО: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(item.name)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Телефон: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(item.phone == null ? "" : item.phone)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Почта: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(item.email)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    child: SfBarcodeGenerator(
                      value: item.hash,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    await ticketUpgrateController.fetchUpgredaTicket(
                        evnt_id: ticketModel.event.id,
                        ticket_id: ticketModel.id);

                    Get.to(TicketUpgrade(
                      idTiket: item.tiket.id,
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_rounded, color: Colors.black),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Улучшить",
                          style: TextStyle(fontSize: 14, color: Colors.black))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    print(
                        "widget.ticketModel.event.id ${item.tiket.id.toString()}");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.live_tv, color: Colors.black),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Трансляция",
                          style: TextStyle(fontSize: 14, color: Colors.black))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    print(
                        "widget.ticketModel.event.id ${ticketModel.event.id}");
                    print("widget.ticketModel.id ${ticketModel.id}");
                    print(" item.hash ${item.hash}");

                    await ticketdop.fetchFile(
                        event_id: ticketModel.event.id,
                        tiket_id: ticketModel.id,
                        hash_id: item.hash);
                    Get.to(LoadDopMaterial());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_download,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Материалы",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 18,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 2.23),
                  color: kYellowColor,
                ),
                child: TextButton(
                    onPressed: () async {
                      ticketsController.event_id.value = item.event_id;
                      ticketsController.tiket_id.value = item.tiket_id;
                      Get.to(TiketPersonSetings(
                        ticket: item.tiket,
                      ));
                    },
                    child: Text(
                      "Изменить",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
              )
            ],
          )
        ],
      ),
    ),
    isExpanded: item.isExpanded,
  );
}

Widget _text(String s) {
  return Text(
    s,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}

class ExpansionItem {
  final String name;
  final String phone;
  final String email;
  final String id;
  final String hash;
  final int event_id;
  final int tiket_id;
  final bilet_id;
  var tiket;
  bool isExpanded;

  ExpansionItem(
      {@required this.id,
      @required this.name,
      @required this.phone,
      @required this.email,
      @required this.hash,
      @required this.event_id,
      @required this.tiket_id,
      @required this.tiket,
      @required this.bilet_id,
      this.isExpanded = false});
}
