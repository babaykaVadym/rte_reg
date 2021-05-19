import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/models/event_model.dart';
import 'package:rte_cubit/pages/enent/coment_page.dart';
import 'package:rte_cubit/pages/enent/image_page.dart';
import 'package:rte_cubit/pages/parson_draw/person_screen.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/user_image_widgets.dart';

class EventBlocBuild extends StatefulWidget {
  DatumComent article;
  EventController eventController;
  EventBlocBuild({this.article, @required this.eventController});
  @override
  _EventBlocBuildState createState() => _EventBlocBuildState();
}

class _EventBlocBuildState extends State<EventBlocBuild> {
  // EventController eventController = Get.find();
  ComentController comentController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(
        "ardsdssdsddssdsdsd.article.cometntCounts.value ${widget.article.user.avatarUrl}");
    print("widget.eventController.UserId ${widget.eventController.UserId}");
    widget.eventController.UserId.value == widget.article.user.id
        ? print("true")
        : print("false");
  }

//widget.article.commentsCount
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.95;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      //  padding: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                if (widget.article.user.id != Const.UserID) {
                  Get.to(PersonScreen(
                    namePerson: widget.article.user.firstName,
                    company: widget.article.user.company,
                    mailPerson: widget.article.user.email,
                    telephone: widget.article.user.telephoneFullNumber,
                    UserId: widget.article.user.id,
                    nameSecPerson: widget.article.user.lastName,
                  ));
                }
              },
              child: Row(
                children: [
                  widget.article.user.id == widget.eventController.UserId.value
                      ? UserImageWidgets()
                      : CircleAvatar(
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: kYellowColor,
                            size: 35,
                          ),
                          backgroundColor: kAppBarColot,
                          maxRadius: 30,
                          minRadius: 20,
                        ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.article.user.firstName +
                                        widget.article.user.lastName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  /*Text(
                                    " widget.article.user.company",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),*/
                                ],
                              ),
                            ),
                            Text(DateFormat('dd MMM - HH:mm')
                                .format(widget.article.createAt))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: c_width,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.article.description),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          widget.article.imageUrl == null
              ? SizedBox(
                  height: 1,
                )
              : Container(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ImagePage(
                        urll: widget.article.imageUrl,
                      ));
                    },
                    child: CachedNetworkImage(
                      imageUrl: widget.article.imageUrl,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

          /*Container(
            child: GestureDetector(
              onTap: () {
                Get.to(ImagePage(
                  urll: widget.article.imageUrl,
                ));
              },
              child: Image.network(
                widget.article.imageUrl == null ? "" : widget.article.imageUrl,
                fit: BoxFit.cover,
                cacheHeight: 400,
              ),
            ),
          ),*/
          Container(
            height: 50,
            width: c_width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Obx(() => TextButton(
                        child: Row(
                          children: [
                            Icon(
                              widget.article.user.isLiked.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Нравится (${widget.article.likes.length})",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          if (widget.article.user.isLiked.value == false) {
                            widget.article.user.isLiked.toggle();

                            final result = await widget.eventController.like(
                                widget.article.event.id, widget.article.id);
                            print("resul likeeee");
                          } else if (widget.article.user.isLiked.value ==
                              true) {
                            widget.article.user.isLiked.toggle();
                            final result = await widget.eventController.Unlike(
                                widget.article.event.id, widget.article.id);
                            print("resul UNNNNUUlikeeee");
                          }
                        },
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                _buildRow(
                    icon: Icon(
                      Icons.chat,
                      color: kAppBarColot,
                    ),
                    title:
                        "Коментировать (${widget.article.cometntCounts.value == 0 ? widget.article.commentsCount : widget.article.cometntCounts.value})",
                    onTap: () async {
                      comentController.event_id.value = widget.article.event.id;
                      comentController.coment_id.value = widget.article.id;

                      await comentController.fetchComent();
                      widget.eventController.eventListLikes.value =
                          widget.article.likes;

                      Get.to(ComentsPage(
                        eventController: widget.article,
                      ));
                    }),
                Flexible(child: Container()),
                PopupMenuButton(
                  itemBuilder: (BuildContext bc) => [
                    PopupMenuItem(
                        child: TextButton(
                      child: Text("Копировать",
                          style: Theme.of(context).textTheme.bodyText1),
                      onPressed: () {
                        Clipboard.setData(new ClipboardData(
                            text: widget.article.description));
                        Get.back();
                      },
                    )),
                    PopupMenuItem(
                      child: TextButton(
                        child: Text(
                          "Сохранить фотографию",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onPressed: () async {
                          var response = await Dio().get(
                              widget.article.imageUrl,
                              options:
                                  Options(responseType: ResponseType.bytes));
                          final result = await ImageGallerySaver.saveImage(
                            Uint8List.fromList(response.data),
                            quality: 60,
                          );

                          print(result);
                          Get.back();
                        },
                      ),
                    ),
                    PopupMenuItem(
                        child: Text("Пожаловаться на публикацию"),
                        value: "/settings"),
                  ],
                  onSelected: (rout) {
                    print(rout);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildRow({String title, Function onTap, Icon icon}) {
  return Container(
    height: 60,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 3,
            ),
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    ),
  );
}
