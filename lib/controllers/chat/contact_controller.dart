import 'dart:async';

import 'package:get/get.dart';
import 'package:rte_cubit/models/chat_model/contact_modal.dart';
import 'package:rte_cubit/models/chat_model/contat_repositori.dart';

class ContactController extends GetxController
    with StateMixin<List<ContactModel>> {
  var contactList = RxList();
  static bool start = true;
  GetSocket webSocket;
  var wsData = RxList();

  final isConnected = false.obs;

  void fetchContact() async {
    try {
      var events = await ContactReositori().getEventData();
      if (events != null) {
        if (start) {
          Timer.periodic(Duration(seconds: 5), (timer) {
            fetchContact();
          });

          start = false;
        }

        RxStatus.success();
        contactList.value = events as List<ContactModel>;
      }
    } finally {}
  }
}
