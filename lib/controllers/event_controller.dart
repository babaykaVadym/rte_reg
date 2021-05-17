import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/models/coment_model.dart';
import 'package:rte_cubit/models/event_model.dart';
import 'package:rte_cubit/services/events/coment_provider.dart';
import 'package:rte_cubit/services/events/event_api_provider.dart';

class EventController extends GetxController
    with StateMixin<List<DatumComent>> {
  var event_id_List = List<int>().obs;

  var image;
  var page = 1.obs;
  var maxPage = 0.obs;
  var event_id_coment = 0.obs;
  var coment_id_coment = 0.obs;
  var isFavorite = false.obs;
  var UserId = 0.obs;

  var paginEventID = 0.obs;

  var oldEventList = RxList();

  final eventListM = RxList();
  get eventList => this.eventListM.value;
  set eventList(value) => this.eventListM.value = value;

  final eventListComs = RxList();
  get eventListCom => this.eventListComs.value;
  set eventListCom(value) => this.eventListComs.value = value;
  ScrollController scrollController = ScrollController();
  var isLoading = true.obs;
  static var isLoadingEven = true.obs;
  var isMoreDataAvailable = true.obs;
  var comCount = 0.obs;
  var likesPeoleCount = 0.obs;
  var now = new DateTime.now();
  final eventListLikes = RxList();

  void fetchIdEvents() async {
    try {
      isLoading(true);

      for (var n in event_id_List) {
        var events = await EventProvider().getEventIdData(n);
        if (events != null) {
          RxStatus.success();
          print(
              "events.eventStart events.eventStart 22222222222222222222222  ${events.eventStart}");
          if (events.eventStart.millisecondsSinceEpoch <=
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

  void fetchEventsComent(event_id) async {
    try {
      isLoading(true);

      var events = await EventProvider()
          .getEventData(event_id: event_id, page: page.value);
      if (events != null) {
        paginEventID.value = event_id;
        RxStatus.success();
        paginateTask();

        print("paffffffffffffffffff ${page.value}");
        eventListComs.value = events as List<DatumComent>;
        eventListComs.refresh();
      }
    } finally {
      isLoading(false);
    }
  }

  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page.value++;

        getMoreTask(paginEventID.value, page.value);
      }
    });
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  void refreshList(event_id) async {
    page.value = 1;
    fetchEventsComent(event_id);
  }

  void getMoreTask(event_id, var page) {
    try {
      EventProvider().getEventData(event_id: event_id, page: page).then((resp) {
        if (resp.length > 0) {
          isMoreDataAvailable(true);
        }

        eventListComs.value.addAll(resp);
        eventListComs.refresh();
      }, onError: (err) {
        isMoreDataAvailable(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
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
    fetchEventsComent(event_id);
    // this.eventListComs.refresh();
    //  eventListM.refresh();
  }

  Unlike(event_id, coment_id) async {
    await EventProvider().setdUnLike(event_id, coment_id);
    fetchEventsComent(event_id);
    //this.eventListComs.refresh();
    //  eventListM.refresh();
  }

  sendComent({ComentModel item, event_id, coment_id}) async {
    await ComentProvider().setdComentData(event_id, coment_id, item);
    Get.put(EventController());
    fetchEventsComent(event_id);
    //  this.eventListComs.refresh();
  }
}
