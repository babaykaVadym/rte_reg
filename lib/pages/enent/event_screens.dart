import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/inputInfo.dart';

import 'event_bloc_buld.dart';

class EventsScrents extends GetView<EventController> {
  int event_id;

  EventsScrents({this.event_id});
  final scaffoldKeys = GlobalKey<ScaffoldState>();
  ComentController comentController = Get.find();
  File _image;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    print(Const.token);
    return Scaffold(
      key: scaffoldKeys,
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Лента собитий', style: Theme.of(context).textTheme.headline1),
      ),
      body: GetX<EventController>(
          initState: (state) => Get.find<EventController>(),
          builder: (_) {
            return _.eventListCom.length == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            controller: _.scrollController,
                            itemCount: _.eventListCom.length,
                            itemBuilder: (context, index) {
                              if (index == _.eventListCom.length - 1 &&
                                  controller.isMoreDataAvailable.value ==
                                      true) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              // controller.fetchLikesList();
                              for (int i = 0;
                                  i < _.eventListCom[index].likes.length;
                                  i++) {
                                if (_.eventListCom[index].likes[i].id ==
                                    controller.UserId.value) {
                                  _.eventListCom[index].user.isLiked.value =
                                      true;
                                }
                              }

                              return EventBlocBuild(
                                article: _.eventListCom[index],
                                eventController: controller,
                              );
                            }),
                      ),
                      Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: InputText(
                            imageFile: _imageFile,
                            event_id: event_id,
                            scaffoldKeys: scaffoldKeys,
                          )),
                    ],
                  );
          }),
    );
  }
}
