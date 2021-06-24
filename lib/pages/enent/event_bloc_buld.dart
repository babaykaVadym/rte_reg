import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/models/db/data_base_model.dart';
import 'package:rte_cubit/pages/enent/coment_page.dart';
import 'package:rte_cubit/pages/enent/image_page.dart';
import 'package:rte_cubit/pages/notes_screen/data_base_helper.dart';
import 'package:rte_cubit/pages/parson_draw/person_screen.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/services/getLoadNotif.dart';
import 'package:rte_cubit/widgets/scan_bar.dart';

class EventBlocBuild extends StatefulWidget {
  var article;

  EventController eventController;
  bool isDB;
  EventBlocBuild(
      {this.article, @required this.eventController, @required this.isDB});
  @override
  _EventBlocBuildState createState() => _EventBlocBuildState();
}

class _EventBlocBuildState extends State<EventBlocBuild> {
  TextEditingController _controller = TextEditingController();
  void addToDB({type, evet_id, post, userid}) async {
    var db = new DatabaseHelper();
    var coment = DataBaseMaodel(type, evet_id, post, userid);
    await db.saveUser(coment);
  }

  void deletDB({DataBaseMaodel}) async {
    var db = new DatabaseHelper();
    await db.deleteUsers(DataBaseMaodel);
  }

  ComentController comentController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    print(widget.eventController.event_id_db_List.value);
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
                  print("test ${widget.article.user}");

                  Get.to(PersonScreen(
                    data: widget.article.user,
                  ));
                }
              },
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        widget.article.user.avatarUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                                        " " +
                                        widget.article.user.lastName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                      filterQuality: FilterQuality.medium,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Container(
            height: 50,
            width: c_width,
            child: widget.isDB
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            print(
                                widget.eventController.event_id_db_List.value);
                            setState(() {
                              deletDB(DataBaseMaodel: widget.article.id);

                              widget.eventController.event_id_db_List
                                  .remove(widget.article.id);
                              widget.eventController.event_id_db_List.refresh();
                              widget.eventController.eventDBList
                                  .remove(widget.article);
                              widget.eventController.eventDBList.refresh();
                              widget.eventController.eventListComs.refresh();
                              widget.eventController.refresh();
                              print(widget
                                  .eventController.event_id_db_List.value);
                            });
                          },
                          child: Text(
                            "Удалить из заметок",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ))
                    ],
                  )
                : Row(
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
                                if (widget.article.user.isLiked.value ==
                                    false) {
                                  // widget.article.user.isLiked.toggle();

                                  final result = await widget.eventController
                                      .like(widget.article.event.id,
                                          widget.article.id);
                                } else if (widget.article.user.isLiked.value ==
                                    true) {
                                  // widget.article.user.isLiked.toggle();
                                  final result = await widget.eventController
                                      .Unlike(widget.article.event.id,
                                          widget.article.id);
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
                            //color: kAppBarColot,
                          ),
                          title:
                              "Коментировать (${widget.article.cometntCounts.value == 0 ? widget.article.commentsCount : widget.article.cometntCounts.value})",
                          onTap: () async {
                            comentController.event_id.value =
                                widget.article.event.id;
                            comentController.coment_id.value =
                                widget.article.id;
                            comentController.comentsLists.clear();
                            Get.to(ComentsPage(
                              eventController: widget.article,
                            ));
                            await comentController.fetchComent();
                            widget.eventController.eventListLikes.value =
                                widget.article.likes;
                          }),
                      Flexible(child: Container()),
                      PopupMenuButton(
                        itemBuilder: (BuildContext bc) => [
                          PopupMenuItem(
                            child: Text("Копировать",
                                style: Theme.of(context).textTheme.bodyText1),
                            value: (0),
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Сохранить фотографию",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: (1),
                          ),
                          PopupMenuItem(
                            child: Text(
                              !widget.eventController.event_id_db_List.value
                                      .contains(widget.article.id)
                                  ? "Добавить в заметки"
                                  : "Добавлено",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: (2),
                          ),
                          PopupMenuItem(
                              child: Text("Пожаловаться на публикацию",
                                  style: Theme.of(context).textTheme.bodyText1),
                              value: (3)),
                        ],
                        onSelected: (rout) async {
                          print("rout ${rout.toString()}");

                          switch (rout) {
                            case 0:
                              Clipboard.setData(new ClipboardData(
                                  text: widget.article.description));
                              snacBars(
                                  text: "Скопировано",
                                  color: Colors.green[100],
                                  context: context,
                                  duration: Duration(milliseconds: 500));

                              break;
                            case 1:
                              var response = await Dio().get(
                                  widget.article.imageUrl,
                                  options: Options(
                                      responseType: ResponseType.bytes));
                              final result = await ImageGallerySaver.saveImage(
                                Uint8List.fromList(response.data),
                                quality: 60,
                              );
                              snacBars(
                                  text: "Сохранено",
                                  color: Colors.green[100],
                                  context: context,
                                  duration: Duration(milliseconds: 500));
                              break;
                            case 2:
                              if (!widget.eventController.event_id_db_List.value
                                  .contains(widget.article.id)) {
                                await addToDB(
                                    evet_id: widget.article.event.id,
                                    post: widget.article.id,
                                    type: "post",
                                    userid: 0);

                                GetLoadNotif().getId();
                                widget.eventController.event_id_db_List
                                    .refresh();
                                snacBars(
                                    text: "Добавлено в заметки",
                                    color: Colors.green[100],
                                    context: context,
                                    duration: Duration(milliseconds: 500));
                              } else {
                                snacBars(
                                    text: "Уже добавлен",
                                    color: Colors.yellow[200],
                                    context: context,
                                    duration: Duration(milliseconds: 500));
                              }
                              break;
                            case 3:
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Напишите жалобу:"),
                                    content: Container(
                                      width: 350,
                                      child: TextField(
                                        minLines: 1,
                                        maxLines: 6,
                                        decoration: InputDecoration(
                                          alignLabelWithHint: true,
                                          contentPadding: EdgeInsets.all(8),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        controller: _controller,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("Отправить"),
                                        onPressed: () {
                                          Navigator.pop(
                                              context, _controller.text);
                                          _controller.clear();
                                        },
                                      )
                                    ],
                                  );
                                },
                              ).then((val) async {
                                var item = {"report_text": val};

                                var request = await http.post(
                                    Uri.parse(kUrlApi +
                                        'events/${widget.article.event.id}/posts/${widget.article.id}/reports'),
                                    headers: requestHeaders,
                                    body: json.encode(item));

                                if (request.statusCode == 200) {
                                  snacBars(
                                      text: "Жалоба отправлена",
                                      color: Colors.green[200],
                                      context: context,
                                      duration: Duration(milliseconds: 600));
                                } else if (request.statusCode == 500) {
                                  snacBars(
                                      text: "Уже отправляли",
                                      color: Colors.red,
                                      context: context,
                                      duration: Duration(milliseconds: 600));
                                } else {
                                  snacBars(
                                      text: "Ошибка публикации",
                                      color: Colors.red,
                                      context: context,
                                      duration: Duration(milliseconds: 600));
                                }
                              });
                              break;
                          }
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
