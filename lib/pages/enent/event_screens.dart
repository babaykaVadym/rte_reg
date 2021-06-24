import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listview_utils/listview_utils.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/widgets/inputInfo.dart';

import 'endDrawer/menu_event.dart';
import 'event_bloc_buld.dart';

class EventsScrents extends GetView<EventController> {
  int event_id;
  var eventModel;

  EventsScrents({this.event_id, this.eventModel});

  ComentController comentController = Get.find();
  File _image;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EndDrawerMenu(
        event_id: event_id,
        eventIdModel: eventModel,
      ),
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Лента собитий', style: Theme.of(context).textTheme.headline1),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: GetX<EventController>(
          initState: (state) => Get.find<EventController>(),
          builder: (_) {
            print("_.eventListCom.length ${_.eventListCom.length}");

            return _.eventListCom.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: CustomListView(
                            header: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  eventModel.logo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            itemCount: _.eventListCom.length,
                            itemBuilder: (BuildContext context, int index, _) {
                              // controller.fetchLikesList();
                              // index++;

                              for (int i = 0;
                                  i <
                                      controller
                                          .eventListCom[index].likes.length;
                                  i++) {
                                if (controller
                                        .eventListCom[index].likes[i].id ==
                                    controller.UserId.value) {
                                  controller.eventListCom[index].user.isLiked
                                      .value = true;
                                }
                              }

                              return EventBlocBuild(
                                article: controller.eventListCom[index],
                                eventController: controller,
                                isDB: false,
                              );
                            }),
                      ),
                      Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: InputText(
                            imageFile: _imageFile,
                            event_id: event_id,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  );
          }),
    );
  }
}
