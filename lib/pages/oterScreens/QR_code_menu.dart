import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/pages/parson_draw/person_screen.dart';

class QrCodeMenu extends GetView<UserController> {
  bool faund;
  QrCodeMenu({this.faund});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GetX<UserController>(
        initState: (state) => Get.find<UserController>(),
        builder: (controller) {
          var data = controller.userId.value;

          return controller.userId.value == null
              ? Center(
                  child: Text("Неверный код"),
                )
              : faund
                  ? PersonScreen(
                      data: data,
                    )
                  : Center(
                      child: Text("Неверный код"),
                    );

          /*ListBuilContacts(
                  data: controller.userId.value,
                )*/
          ;
        },
      ),
    );
  }
}
