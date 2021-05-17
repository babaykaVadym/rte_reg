import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/models/tickets_model.dart';
import 'package:rte_cubit/pages/tiket/tikets_person_seting.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class TicketMenuScreenObx extends GetView<TicketsController> {
  DatumData ticketModel;
  TicketMenuScreenObx({this.ticketModel});
  var expansionItem;
  @override
  Widget build(BuildContext context) {
    print(
        "ticketModel.tickets[i].holder.id.toString() ${ticketModel.tickets[0].holder.id.toString()}");
    _getParam();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Номер заказа #${ticketModel.id} ',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: controller.obx(
        (data) => SafeArea(
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
                        ticketModel.event.logoUrl,
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
                            ticketModel.event.title,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          _text(DateFormat('dd MMM - HH:mm')
                              .format(ticketModel.event.eventStart)),
                          _text('Telefon: '),
                          Text(
                            ticketModel.creator.telephoneFullNumber,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          _text("Email: "),
                          Text(
                            ticketModel.creator.email,
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
                  shrinkWrap: true,
                  children: [
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        expansionItem[index].isExpanded =
                            !expansionItem[index].isExpanded;
                      },
                      children: [
                        ...expansionItem.map(
                          (value) => _buildFaqRow(
                              value, context, controller, ticketModel),
                        )
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

  void _getParam() {
    for (int i = 0; i < ticketModel.tickets.length + 1; i++) {
      expansionItem = List<ExpansionItem>.generate(
          i,
          (i) => ExpansionItem(
                id: ticketModel.tickets[i].holder.id.toString(),
                name: ticketModel.tickets[i].holder.firstName,
                phone: ticketModel.tickets[i].holder.telephoneFullNumber,
                email: ticketModel.tickets[i].holder.email,
                hash: ticketModel.tickets[i].hash,
                tiket_id: int.parse(ticketModel.id),
                event_id: ticketModel.event.id,
                tiket: ticketModel.tickets[i],
              ));
    }
  }
}

Widget _text(String s) {
  return Text(
    s,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
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
      margin: EdgeInsets.only(bottom: 24, left: 24, right: 24),
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
