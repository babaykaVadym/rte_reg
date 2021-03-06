import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/models/coment_model.dart';
import 'package:rte_cubit/models/event_contact_model.dart';
import 'package:rte_cubit/models/event_model.dart';
import 'package:rte_cubit/services/events/coment_provider.dart';
import 'package:rte_cubit/services/events/event_api_provider.dart';

class EventController extends GetxController
    with StateMixin<List<DatumComent>> {
  var event_id_List = List<int>().obs;
  var event_id_db_List = List<int>().obs;
  var image;
  var page = 1.obs;
  var maxPage = 0.obs;
  var event_id_coment = 0.obs;
  var coment_id_coment = 0.obs;
  var isFavorite = false.obs;
  var UserId = 0.obs;
  var pageContact = 1.obs;
  var pageContactTotalP = 0.obs;
  var paginEventID = 0.obs;
  var paginEventIDContact = 0.obs;
  var eventComentTotalP = 0.obs;
  var userAvatar = "".obs;
  var oldEventList = RxList();
  var eventContactLict = List<EventContact>().obs;
  final eventListM = RxList();
  get eventList => this.eventListM.value;
  set eventList(value) => this.eventListM.value = value;

  final eventListComs = RxList();
  get eventListCom => this.eventListComs.value;
  set eventListCom(value) => this.eventListComs.value = value;
  var eventDBList = List<DatumComent>().obs;
  var isLoading = true.obs;
  static var isLoadingEven = true.obs;

  var comCount = 0.obs;
  var likesPeoleCount = 0.obs;
  var now = new DateTime.now();
  var eventListLikes = RxList();

  void fetchIdEvents() async {
    try {
      isLoading(true);

      for (int n = 0; n < event_id_List.length; n++) {
        var events = await EventProvider().getEventIdData(event_id_List[n]);
        if (events != null) {
          RxStatus.success();

          if (events.eventEnd.millisecondsSinceEpoch <=
              now.millisecondsSinceEpoch) {
            oldEventList.value.add(events);
          } else {
            eventListM.value.add(events);
            eventListM.refresh();
          }
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchEventContact(event_id) async {
    var eventContact = await EventProvider()
        .getEventContact(event_id: event_id, page: pageContact.value);
    if (eventContact != null) {
      RxStatus.success();

      paginEventIDContact.value = event_id;
      if (pageContactTotalP > 1) {
        paginateContact();
      }

      eventContactLict.value = eventContact as List<EventContact>;
      eventContactLict.refresh();
    }
  }

  void fetchEventsComent(event_id) async {
    try {
      isLoading(true);

      var events = await EventProvider()
          .getEventData(event_id: event_id, page: page.value);
      if (events != null) {
        paginEventID.value = event_id;
        RxStatus.success();
        if (eventComentTotalP.value > 1) {
          paginateTask();
        }

        eventListComs.value = events as List<DatumComent>;
        eventListComs.refresh();
      }
    } finally {
      isLoading(false);
    }
  }

  void paginateContact() async {
    for (int i = 0; i <= pageContactTotalP.value; i++) {
      pageContact.value++;
      await getMoreContact(paginEventIDContact.value, pageContact.value);
    }
  }

  void paginateTask() async {
    for (int i = 0; i <= eventComentTotalP.value; i++) {
      page.value++;

      await getMoreTask(paginEventID.value, page.value);
    }
  }

  showSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
  }

  void refreshList(event_id) async {
    page.value = 1;
    fetchEventsComent(event_id);
  }

  void getMoreTask(event_id, var page) {
    try {
      EventProvider().getEventData(event_id: event_id, page: page).then((resp) {
        eventListComs.value.addAll(resp);
        eventListComs.refresh();
      }, onError: (err) {
        showSnackBar("Error", err.toString());
      });
    } catch (exception) {
      showSnackBar("Exception", exception.toString());
    }
  }

  void getMoreContact(event_id, var page) {
    try {
      EventProvider().getEventContact(event_id: event_id, page: page).then(
          (respo) {
        eventContactLict.value.addAll(respo);
        eventContactLict.refresh();
      }, onError: (err) {
        showSnackBar("Error", err.toString());
      });
    } catch (exception) {
      showSnackBar("Exception", exception.toString());
    }
  }

  send({DatumComent item, event_id}) async {
    await EventProvider().setEventData(event_id, item);
    fetchEventsComent(event_id);
    refreshList(event_id);

    // eventListComs.refresh();
  }

  sendTxt({DatumComentTxt item, event_id}) async {
    await EventProvider().setEventData(event_id, item);
    fetchEventsComent(event_id);
    refreshList(event_id);

    // eventListComs.refresh();
  }

  like(event_id, coment_id) async {
    await EventProvider().setdLike(event_id, coment_id);
    page.value = 1;
    fetchEventsComent(event_id);
    // this.eventListComs.refresh();
    eventListM.refresh();
  }

  Unlike(event_id, coment_id) async {
    await EventProvider().setdUnLike(event_id, coment_id);
    page.value = 1;
    fetchEventsComent(event_id);
    eventListM.refresh();
  }

  sendComent({ComentModel item, event_id, coment_id}) async {
    await ComentProvider().setdComentData(event_id, coment_id, item);
    //  Get.put(EventController());
    page.value = 1;

    fetchEventsComent(event_id);
  }

  void fetchIdDBEvents({enet_id, post_id}) async {
    try {
      isLoading(true);

      var events =
          await EventProvider().getEventDb(event_id: enet_id, post_id: post_id);
      if (events != null) {
        // RxStatus.success();
        eventDBList.value.add(events);
      }
    } finally {
      isLoading(false);
    }
  }
}
