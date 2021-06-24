import 'package:get/get.dart';
import 'package:rte_cubit/controllers/chat/masseg_controller.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/controllers/ticket/ticket_upgrade_controller.dart';
import 'package:rte_cubit/controllers/ticket/tiket_dop_controler.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/services/consts.dart';

class LoadScrepss {
  TicketsController ticketsController;
  EventController eventController;
  UserController userController;
  ComentController comentController;
  TicketDopController ticketdop;
  TicketUpgrateController _ticketUpgrateController;
  MessegeController messegeController;
  RunTikets() async {
    await Get.reset();

    ticketsController = Get.put<TicketsController>(TicketsController());
    eventController = Get.put<EventController>(EventController());
    userController = Get.put<UserController>(UserController());
    comentController = Get.put<ComentController>(ComentController());
    ticketdop = Get.put(TicketDopController());
    messegeController = Get.put<MessegeController>(MessegeController());
    _ticketUpgrateController = Get.put(TicketUpgrateController());
    await ticketsController.fetchTickets();

    for (int i = 0; i < ticketsController.ticketsList.length; i++) {
      if (eventController.event_id_List.value
          .contains(ticketsController.ticketsList[i].event.id)) {
      } else {
        eventController.event_id_List.value
            .add(ticketsController.ticketsList[i].event.id);
      }
    }

    await eventController.fetchIdEvents();

    eventController.UserId.value = userController.UserD.value.id == null
        ? 0
        : userController.UserD.value.id;
    Const.UserID = userController.UserD.value.id;
    comentController.UserId.value = userController.UserD.value.id;
    eventController.userAvatar.value = userController.UserD.value.avatarUrl;
  }
}
