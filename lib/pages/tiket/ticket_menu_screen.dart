import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/models/tickets_model.dart';
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

  var expansionItem;
  void _getParam() {
    for (int i = 0; i < widget.ticketModel.tickets.length + 1; i++) {
      expansionItem = List<ExpansionItem>.generate(
          i,
          (i) => ExpansionItem(
                id: widget.ticketModel.tickets[i].holder.id.toString(),
                name: widget.ticketModel.tickets[i].holder.firstName,
                phone: widget.ticketModel.tickets[i].holder.telephoneFullNumber,
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
          'Номер заказа #${widget.ticketModel.id} ',
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
                    height: 150,
                    width: 150,
                    child: Image.network(
                      widget.ticketModel.event.logoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        _text('Name:  '),
                        Text(
                          widget.ticketModel.event.title,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        _text(DateFormat('dd MMM - HH:mm')
                            .format(widget.ticketModel.event.eventStart)),
                        _text('Telefon: '),
                        Text(
                          widget.ticketModel.creator.telephoneFullNumber,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        _text("Email: "),
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
                        (value) => _buildFaqRow(value, context,
                            ticketsController, widget.ticketModel),
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

ExpansionPanel _buildFaqRow(
    ExpansionItem item, context, ticketsController, ticketModel) {
  return ExpansionPanel(
    canTapOnHeader: true,
    headerBuilder: (BuildContext context, bool isExpanded) {
      return ListTile(
        title: Text(
          'Bilet: ${item.hash}',
          textAlign: TextAlign.center,
          // style: Theme.of(context).textTheme.subtitle1,
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
                children: [
                  Text(
                    'Name: ${item.name}',
                  ),
                  Text(
                    'Fone: ${item.phone}',
                  ),
                  Text(
                    'Email: ${item.email}',
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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Улучшить", style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.live_tv),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Трансляция", style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.file_download),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Материалы",
                        style: TextStyle(fontSize: 12),
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
              TextButton(
                onPressed: () {
                  print(ticketModel.id);
                  ticketsController.event_id.value = item.event_id;
                  ticketsController.tiket_id.value = item.tiket_id;
                  Get.to(TiketPersonSetings(
                    ticket: item.tiket,
                  ));
                },
                child: Text(
                  "Изменить информацию",
                ),
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
      this.isExpanded = false});
}
