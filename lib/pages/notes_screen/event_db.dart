import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/pages/enent/event_bloc_buld.dart';

class EventDb extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<EventController>(
        initState: (state) => Get.find<EventController>(),
        builder: (_) {
          print("1111111111 ${_.eventDBList.value}");

          return _.eventDBList.value.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _.eventDBList.length,
                  itemBuilder: (context, index) {
                    // controller.fetchLikesList();
                    print("_.eventDBList.length ${_.eventDBList.length}");

                    return EventBlocBuild(
                      article: _.eventDBList[index],
                      eventController: controller,
                      isDB: true,
                    );
                  });
        });
  }
}
