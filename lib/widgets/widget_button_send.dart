import 'package:flutter/material.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/models/coment_model.dart';
import 'package:rte_cubit/services/consts.dart';

class ButtonSend extends StatelessWidget {
  ComentController controller;

  EventController eventController;
  TextEditingController controllerController;

  ButtonSend(
      {@required this.controller,
      @required this.controllerController,
      this.eventController});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: () async {
          var dataNow = new DateTime.now();
          final eventData = ComentModel(
            comment: controllerController.text,
            createdAt: dataNow,
          );
          /* final result = await controller.send(
              coment_id: controller.coment_id,
              event_id: controller.event_id,
              item: eventData);*/
          final result2 = await eventController.sendComent(
              coment_id: controller.coment_id,
              event_id: controller.event_id,
              item: eventData);

          controllerController.clear();
          controller.fetchComent();

          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Icon(
          Icons.send,
          color: Colors.white,
          size: 25,
        ),
        backgroundColor: kYellowColor,
        elevation: 0,
      ),
    );
  }
}
