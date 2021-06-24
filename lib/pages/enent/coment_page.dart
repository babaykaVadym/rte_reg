import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/models/event_model.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/comment_widget.dart';
import 'package:rte_cubit/widgets/widget_button_send.dart';

import 'like_people_screen.dart';

class ComentsPage extends GetView<ComentController> {
  DatumComent eventController;

  ComentsPage({this.eventController});
  EventController evCon = Get.find();

  var controllerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(Const.token);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Comments', style: Theme.of(context).textTheme.headline1),
      ),
      body: SafeArea(
        child: GetX<ComentController>(
            initState: (state) => Get.find<ComentController>(),
            builder: (_) {
              return _.comentsList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        _comet(context, _.comentsList.length, eventController),
                        Expanded(
                          child: ListView.builder(
                              itemCount: _.comentsList.length,
                              itemBuilder: (context, index) {
                                for (int i = 0;
                                    i < _.comentsList[index].likes.length;
                                    i++) {
                                  if (_.comentsList[index].likes[i].id ==
                                      controller.UserId.value) {
                                    _.comentsList[index].isLikedComent.value =
                                        true;
                                  }
                                }

                                /* eventController.cometntCounts.value =
                                    _.comentsList.length;*/
                                return CommentWidgets(
                                  comet: _.comentsList[index],
                                  comentController: controller,
                                );
                              }),
                        ),
                        Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // First child is enter comment text input
                                  Flexible(
                                    child: TextField(
                                      minLines: 1,
                                      maxLines: 2,
                                      controller: controllerController,
                                      decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        contentPadding:
                                            EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        hintText: "Комментировать",
                                        hintStyle:
                                            TextStyle(color: Colors.black54),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      onSubmitted: (text) {
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                      child: ButtonSend(
                                    controller: controller,
                                    eventController: evCon,
                                    controllerController: controllerController,
                                  )),
                                ])),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    );
            }),
      ),
    );
  }
}

_comet(context, countComent, eventController) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      Text('Вам и ${eventController.likes.length} еще '),
                      Text('людям понравилось это'),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Get.to(LikePeopele());
                },
              )
            ],
          ),
        ),
        _deviD(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.chat,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text('$countComent комментария')
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

_deviD() {
  return Divider(
    color: Colors.black12,
    height: 20,
    thickness: 2,
    indent: 10,
    endIndent: 10,
  );
}
