import 'dart:async';

import 'package:get/get.dart';
import 'package:rte_cubit/models/chat_model/message_model.dart';
import 'package:rte_cubit/models/chat_model/messeg_repositori.dart';

class MessegeController extends GetxController
    with StateMixin<List<MessageModel>> {
  var messegList = RxList();
  var id = 0.obs;
  var item = IdModel().obs;
  static bool startM = true;
  void fetchMessege() async {
    try {
      var events = await MessegeReositori().getMessege(item.value);
      if (events != null) {
        if (startM) {
          Timer.periodic(Duration(seconds: 5), (timer) {
            fetchMessege();
          });
          startM = false;
        }
        RxStatus.success();
        messegList.value = events as List<MessageModel>;
        messegList.refresh();
      }
    } catch (e) {
      messegList.clear();
    }
  }

  sendMessege({String messege}) async {
    await MessegeReositori().sendMessedge(id: id.value, message: messege);
    fetchMessege();
    // messegList.refresh();
  }

  makeSeen() async {
    await MessegeReositori().makeSeen(id: id.value);
    fetchMessege();
    // messegList.refresh();
  }
}
