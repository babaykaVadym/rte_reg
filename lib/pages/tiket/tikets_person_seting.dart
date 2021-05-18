import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/models/tickets_model.dart';
import 'package:rte_cubit/services/consts.dart';

class TiketPersonSetings extends StatelessWidget {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _positionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _companyController = TextEditingController();
  Ticket ticket;
  TicketsController ticketsController = Get.find();

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _phoneController.dispose();
    _mailController.dispose();
    _lastNameController.dispose();
    _companyController.dispose();
  }

  TiketPersonSetings({this.ticket});

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Настройки билета",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Фамилия:"),
                            TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                labelText: ticket.holder.lastName,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Имя:"),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: ticket.holder.firstName,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("E-mail:"),
                            TextFormField(
                              controller: _mailController,
                              decoration: InputDecoration(
                                  labelText: ticket.holder.email),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Контактный номер:"),
                            TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                labelText: ticket.holder.telephoneNumber,
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Компания:"),
                            TextFormField(
                              controller: _companyController,
                              decoration: InputDecoration(
                                labelText: ticket.holder.company,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Позиция:"),
                            TextFormField(
                              controller: _positionController,
                              decoration: InputDecoration(
                                labelText: ticket.holder.position,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height / 2.23),
                        color: kYellowColor,
                      ),
                      child: TextButton(
                          onPressed: () async {
                            btnSend(context);
                          },
                          child: Text(
                            "Сохранить",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            )),
      ),
    );
  }

  btnSend(context) async {
    FocusScope.of(context).requestFocus(new FocusNode());

    final holdeItem = Ticket(
        holder: Holder(
      lastName: _lastNameController.text.isEmpty
          ? ticket.holder.lastName
          : _lastNameController.text,
      firstName: _nameController.text.isEmpty
          ? ticket.holder.firstName
          : _nameController.text,
      email: _mailController.text.isEmpty
          ? ticket.holder.email
          : _mailController.text,
      telephoneNumber: _phoneController.text.isEmpty
          ? ticket.holder.telephoneNumber
          : _phoneController.text,
      position: _positionController.text.isEmpty
          ? ticket.holder.position
          : _positionController.text,
      company: _companyController.text.isEmpty
          ? ticket.holder.company
          : _companyController.text,
    ));
    final result = await ticketsController.sendTicketSettings(
        tiket_id: ticketsController.tiket_id.value,
        event_id: ticketsController.event_id.value,
        hash_id: ticket.hash,
        item: holdeItem);
    //  await LoadScrepss().RunTikets();
    Timer(Duration(milliseconds: 650), () {
      Get.back();
    });
    Get.back();
    /* Get.off(HomePage(
      currentIndex: 3,
    ));*/
  }
}

/*

Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(ticket.hash),
_textFild(
name: ticket.holder.firstName,
onChanged: (value) {
Holdes.firstName = value;
},
),
_textFild(
name: ticket.holder.lastName,
onChanged: (value) {
Holdes.lastName = value;
},
),
_textFild(
name: ticket.holder.telephoneFullNumber,
onChanged: (value) {
Holdes.telephoneFullNumber = value;
},
),
_textFild(
name: ticket.holder.email,
onChanged: (value) {
Holdes.email = value;
},
),
_textFild(
name: ticket.holder.company,
onChanged: (value) {
Holdes.company = value;
},
),
_textFild(
name: ticket.holder.position,
onChanged: (value) {
Holdes.position = value;
},
),
TextButton(
onPressed: () async {
Holdes.firstName = Holdes.firstName == null
? ticket.holder.firstName
    : Holdes.firstName;
Holdes.lastName = Holdes.lastName == null
? ticket.holder.lastName
    : Holdes.lastName;
Holdes.email =
Holdes.email == null ? ticket.holder.email : Holdes.email;
Holdes.telephoneFullNumber =
Holdes.telephoneFullNumber == null
? ticket.holder.telephoneFullNumber
    : Holdes.telephoneFullNumber;
Holdes.company = Holdes.company == null
? ticket.holder.company
    : Holdes.company;
Holdes.position = Holdes.position == null
? ticket.holder.position
    : Holdes.position;

int event_id = ticketsController.event_id.value;

print("event_id ${ticketsController.event_id}");
print("tiket_id ${ticketsController.tiket_id}");
print("ticket.hash  ${ticket.hash}");

final holderSeting = Ticket(
    holder: Holder(
      firstName: Holdes.firstName,
      lastName: Holdes.lastName,
      email: Holdes.email,
      telephoneFullNumber: Holdes.telephoneFullNumber,
      company: Holdes.company,
      position: Holdes.position,
    ));
*/
/*    final result = await TicketData().setdSeting(
                      tiket_id: ticketsController.tiket_id.value,
                      event_id: ticketsController.event_id.value,
                      hash_id: ticket.hash,
                      item: holderSeting);*/ /*


await ticketsController.fetchTickets();
Get.create(() => TicketsController());
controller.clear();

Get.to(HomeScreen());
},
child: Text("Сохранить"),
)
],
),*/
