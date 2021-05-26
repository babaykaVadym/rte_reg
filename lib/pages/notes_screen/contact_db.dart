import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/widgets/list_bulder_contacts.dart';

class ContactDB extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<UserController>(
        initState: (state) => Get.find<UserController>(),
        builder: (_) {
          print("contact ${_.contactDBList.value}");

          return _.contactDBList.value.isEmpty
              ? Center(
                  child: Text("Отсутствуют заметки"),
                )
              : ListView.builder(
                  itemCount: _.contactDBList.length,
                  itemBuilder: (context, index) {
                    // controller.fetchLikesList();
                    print("_.eventDBList.length ${_.contactDBList.length}");

                    return ListBuilContacts(
                      data: _.contactDBList[index],
                    );
                  });
        });
  }
}
