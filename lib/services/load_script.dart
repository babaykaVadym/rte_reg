import 'package:get/get.dart';
import 'package:rte_cubit/controllers/chat/masseg_controller.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/services/consts.dart';

class LoadScrepss {
  TicketsController ticketsController;
  EventController eventController;
  UserController userController;
  ComentController comentController;

  MessegeController messegeController;
  RunTikets() async {
    await Get.reset();

    ticketsController = await Get.put<TicketsController>(TicketsController());
    eventController = await Get.put<EventController>(EventController());
    userController = Get.put<UserController>(UserController());
    comentController = Get.put<ComentController>(ComentController());

    messegeController = Get.put<MessegeController>(MessegeController());

    await ticketsController.fetchTickets();
    var now = new DateTime.now();
    for (int i = 0; i < ticketsController.ticketsList.length; i++) {
      if (eventController.event_id_List.value
          .contains(ticketsController.ticketsList[i].event.id)) {
      } else {
        eventController.event_id_List.value
            .add(ticketsController.ticketsList[i].event.id);
      }
      print(
          "eventController.event_id_List.value  ${ticketsController.ticketsList.length}");
      /*if (ticketsController
              .ticketsList[i].event.eventEnd.millisecondsSinceEpoch <
          now.millisecondsSinceEpoch) {
        ticketsController.oldTicketsList.value
            .add(ticketsController.ticketsList[i]);
      } else {
        if (ticketsController.ticketsList[i].status.status == "new") {
          ticketsController.newTicketsList.value
              .add(ticketsController.ticketsList[i]);
        } else if (ticketsController.ticketsList[i].status.status != "new") {
          ticketsController.byingTicketsList.value
              .add(ticketsController.ticketsList[i]);
          print(ticketsController.byingTicketsList.length);
        }
      }*/
    }
    print(
        "eventController.event_id_List.value allla ${eventController.event_id_List.value}");
    await eventController.fetchIdEvents();
    //   await userController.fetchUserLogo();

    userController.fetchUserContats();
    eventController.UserId.value = userController.value.id;
    Const.UserID = userController.value.id;
    comentController.UserId.value = userController.value.id;
  }
}
