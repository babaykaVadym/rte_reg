import 'package:get/get.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/models/db/data_base_model.dart';
import 'package:rte_cubit/pages/contact_page/contact_data_helper.dart';
import 'package:rte_cubit/pages/contact_page/contact_db.dart';
import 'package:rte_cubit/pages/notes_screen/data_base_helper.dart';

class GetLoadNotif {
  Future<List<DataBaseMaodel>> _notisList;
  Future<List<ContactDataBaseMaodel>> _contactList;

  EventController eventController = Get.find();
  UserController userController = Get.find();

  void getId() async {
    _notisList = DatabaseHelper.internal().getUser();
    eventController.eventDBList.clear();
    userController.contactDBList.clear();
    await _notisList.then((value) {
      for (int i = 0; i < value.length; i++) {
        if (value[i].type == "post") {
          if (!eventController.event_id_db_List.value
              .contains(value[i].posts)) {
            eventController.event_id_db_List.value.add(value[i].posts);
          }
          eventController.fetchIdDBEvents(
              enet_id: value[i].eventId, post_id: value[i].posts);
        } else if (value[i].type == "user") {
          if (!userController.contactListNotestID.value
              .contains(value[i].userId)) {
            userController.contactListNotestID.value.add(value[i].userId);

            userController.getGBusetId(value[i].userId);
          }
        }
      }
    });
  }

  void getContactSaveDB() async {
    _contactList = ContactDatabaseHelper.internal().getUser();
    userController.contactSvaveDBList.clear();
    await _contactList.then((values) {
      for (int i = 0; i < values.length; i++) {
        if (!userController.contactSaveListID.value
            .contains(values[i].userId)) {
          userController.contactSaveListID.value.add(values[i].userId);
          userController.getContactSaveDB(values[i].userId);
        }
      }
    });
  }
}
