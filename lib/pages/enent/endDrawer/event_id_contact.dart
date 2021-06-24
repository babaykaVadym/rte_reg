import 'package:flutter/material.dart';
import 'package:rte_cubit/models/eventIdmodel.dart';
import 'package:rte_cubit/widgets/list_bulder_contacts.dart';

class EventIdContact extends StatelessWidget {
  Speakers speakers;
  EventIdContact(this.speakers);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Спикеры",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView.builder(
          itemCount: speakers.data.length,
          itemBuilder: (context, index) {
            return ListBuilContacts(
              data: speakers.data[index].info,
            );
          }),
    );
  }
}
