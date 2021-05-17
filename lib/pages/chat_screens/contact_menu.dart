import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/chat/contact_controller.dart';
import 'package:rte_cubit/controllers/chat/masseg_controller.dart';
import 'package:rte_cubit/models/chat_model/message_model.dart';
import 'package:rte_cubit/pages/main_screens/notification_screen.dart';
import 'package:rte_cubit/services/consts.dart';

import 'chat_api.dart';

class ContactMenu extends GetView<ContactController> {
  MessegeController messegeController = Get.find();

  static appBar(context) => AppBar(
        centerTitle: true,
        title: Text(
          "ChatPage",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Get.to(NotificationsScreen());
              })
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetX<ContactController>(
          initState: (state) => Get.find<ContactController>(),
          builder: (_) {
            return _.contactList.length == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: _.contactList.length,
                            itemBuilder: (context, index) {
                              var article = _.contactList[index];

                              return article.id != Const.UserID
                                  ? Container(
                                      height: 50,
                                      margin: const EdgeInsets.all(10),
                                      child: InkWell(
                                        onTap: () async {
                                          final messid =
                                              IdModel(id: article.id);

                                          messegeController.item.value = messid;

                                          await messegeController
                                              .fetchMessege();

                                          messegeController.id.value =
                                              article.id;

                                          Get.to(ChatApi(
                                            firstName: article.firstName,
                                            lastNAme: article.lastName,
                                          ));
                                          //   Get.to(ChatScreen());
                                        },
                                        child: Row(
                                          children: [
                                            Card(
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                              ),
                                              child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: Icon(
                                                    Icons
                                                        .account_circle_outlined,
                                                    size: 35,
                                                  )
                                                  /*Image.network(
                                            article.avatar,
                                            fit: BoxFit.cover,
                                          ),*/
                                                  ),
                                            ),
                                            SizedBox(width: 20),
                                            Flexible(
                                              child: Column(
                                                //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${article.firstName} ${article.lastName} ",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Container(
                                                          child: article.body
                                                                  .contains(
                                                                      'gif#')
                                                              ? Image.network(
                                                                  article.body
                                                                      .split(
                                                                          "#")
                                                                      .last,
                                                                  height: 30,
                                                                )
                                                              : Text(
                                                                  article.body,
                                                                  softWrap:
                                                                      true,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                        ),
                                                      ),
                                                      article.seen == 0
                                                          ? Icon(
                                                              Icons.done_all,
                                                              color:
                                                                  kAppBarColot,
                                                            )
                                                          : Icon(
                                                              Icons.done_all,
                                                              color: Colors
                                                                  .blueAccent,
                                                            )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container();
                            }),
                      ),
                    ],
                  );
          }),
    );
  }
}
