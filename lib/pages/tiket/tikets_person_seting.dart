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
                          onPressed: () {
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

//
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

    Get.back();

    /* Get.off(HomePage(
      currentIndex: 3,
    ));*/
  }
}
