import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/list_bulder_contacts.dart';

class UScnned extends GetView<UserController> {
  bool isStarts = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Отсканирование QR-коды",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: GetX<UserController>(
          initState: (state) => Get.find<UserController>(),
          builder: (controller) {
            if (isStarts) {
              if (!controller.UserD.value.uScanned.isEmpty) {
                controller.btnUScan.value = true;
                controller.btnUScanBy.value = false;

                isStarts = false;
              } else if (!controller.UserD.value.uScannedBy.isEmpty) {
                controller.btnUScan.value = false;
                controller.btnUScanBy.value = true;
                controller.menuBtn.value = false;
                isStarts = false;
              } else {
                controller.btnUScan.value = true;
                controller.btnUScanBy.value = false;
                isStarts = false;
              }
            }

            print("userScan00 ${controller.UserD.value.uScanned.length}");
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.btnUScan.value = true;
                          controller.btnUScanBy.value = false;
                          controller.menuBtn.value = true;
                          controller.UserD.refresh();
                        },
                        child: Text(
                          "Вы отсканировали",
                          style: TextStyle(
                              fontSize: 16,
                              color: controller.btnUScan.value
                                  ? kYellowColor
                                  : Colors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          controller.btnUScan.value = false;
                          controller.btnUScanBy.value = true;
                          controller.menuBtn.value = false;
                          controller.UserD.refresh();
                        },
                        child: Text(
                          "Вас отсканировали",
                          style: TextStyle(
                              fontSize: 16,
                              color: controller.btnUScanBy.value
                                  ? kYellowColor
                                  : Colors.black),
                        ))
                  ],
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: controller.UserD.value.uScanned.length,
                    itemBuilder: (context, index) {
                      var userScan = controller.UserD.value.uScanned[index];

                      //   var userScanBy = controller.UserD.value.uScannedBy[index];

                      if (controller.menuBtn.value) {
                        print(controller.UserD.value.uScanned[index].avatarUrl);
                        return controller.UserD.value.uScanned.isEmpty
                            ? Container()
                            : ListBuilContacts(
                                data: controller.UserD.value.uScanned[index],
                              );
                      } else {
                        return controller.UserD.value.uScannedBy.isEmpty
                            ? Container()
                            : ListBuilContacts(
                                data: controller.UserD.value.uScannedBy[index],
                              );
                      }
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
