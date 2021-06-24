import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/chat/masseg_controller.dart';
import 'package:rte_cubit/pages/chat_screens/input_fild.dart';
import 'package:rte_cubit/pages/enent/image_page.dart';
import 'package:rte_cubit/services/consts.dart';

class ChatApi extends GetView<MessegeController> {
  final ScrollController _scrollController = ScrollController();
  bool scrole = true;
  int countL;
  String firstName, lastNAme;
  ChatApi({this.firstName, this.lastNAme});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.people),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "$firstName $lastNAme",
              style: TextStyle(color: kTextColors),
            )
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: GetX<MessegeController>(
        initState: (state) => Get.find<MessegeController>(),
        builder: (controller) {
          return controller.messegList.length == 0
              ? Column(
                  children: [
                    Expanded(child: Container()),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InputFildChat(_scrollController),
                    )
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: controller.messegList.length,
                          itemBuilder: (context, index) {
                            var messeg = controller.messegList[index];

                            if (scrole) {
                              Timer(
                                  Duration(milliseconds: 50),
                                  () => _scrollController.jumpTo(
                                      _scrollController
                                          .position.maxScrollExtent));
                              Timer(Duration(milliseconds: 800), () {
                                scrole = false;
                                print(scrole);
                              });
                            }

                            if (countL != controller.messegList.length) {
                              controller.makeSeen();
                              countL = controller.messegList.length;
                              print("ok");
                            }

                            /* _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);*/
                            //messeg.fromId == toId
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 2, bottom: 2),
                              child: messeg.fromId == Const.UserID
                                  ? Container(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8),
                                        padding: EdgeInsets.all(5),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            messeg.attachment != null
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(ImagePage(
                                                            urll:
                                                                "https://a.rte.im/storage/attachments/${messeg.attachment.split(",").first}",
                                                          ));
                                                        },
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              "https://a.rte.im/storage/attachments/${messeg.attachment.split(",").first}",
                                                          height: 380,
                                                          fit: BoxFit.fitHeight,
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        ),

                                                        /*Image.network(
                                                          "https://a.rte.im/storage/attachments/${messeg.attachment.split(",").first}",
                                                          height: 350,
                                                        ),*/
                                                      ),
                                                      Text(
                                                        messeg.body,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )
                                                : messeg.body.contains('gif#')
                                                    ? Image.network(
                                                        messeg.body
                                                            .split("#")
                                                            .last,
                                                        height: 50,
                                                      )
                                                    : Text(
                                                        messeg.body,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(DateFormat('dd.MM').format(
                                                            messeg.createdAt) ==
                                                        DateFormat('dd.MM')
                                                            .format(
                                                                DateTime.now())
                                                    ? DateFormat('HH:mm')
                                                        .format(
                                                            messeg.createdAt)
                                                    : DateFormat('dd.MMM')
                                                        .format(
                                                            messeg.createdAt)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                messeg.seen == 0
                                                    ? Icon(
                                                        Icons.done_all,
                                                        color: kAppBarColot,
                                                      )
                                                    : Icon(
                                                        Icons.done_all,
                                                        color:
                                                            Colors.blueAccent,
                                                      ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8),
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            messeg.attachment != null
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(ImagePage(
                                                            urll:
                                                                "https://a.rte.im/storage/attachments/${messeg.attachment.split(",").first}",
                                                          ));
                                                        },
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              "https://a.rte.im/storage/attachments/${messeg.attachment.split(",").first}",
                                                          height: 350,
                                                          width: 350,
                                                          placeholder: (context,
                                                                  url) =>
                                                              CircularProgressIndicator(),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        ),
                                                        /*Image.network(
                                                          "https://a.rte.im/storage/attachments/${messeg.attachment.split(",").first}",
                                                          height: 350,
                                                        ),*/
                                                      ),
                                                      Text(
                                                        messeg.body,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )
                                                : messeg.body.contains('gif#')
                                                    ? Image.network(
                                                        messeg.body
                                                            .split("#")
                                                            .last,
                                                        height: 40,
                                                      )
                                                    : Text(
                                                        messeg.body,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons
                                                    .account_circle_rounded),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(DateFormat('dd.MM').format(
                                                            messeg.createdAt) ==
                                                        DateFormat('dd.MM')
                                                            .format(
                                                                DateTime.now())
                                                    ? DateFormat('HH:mm')
                                                        .format(
                                                            messeg.createdAt)
                                                    : DateFormat('dd.MMM')
                                                        .format(
                                                            messeg.createdAt)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                            );
                          }),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InputFildChat(_scrollController),
                    )
                  ],
                );
        },
      ),
    );
  }
}
