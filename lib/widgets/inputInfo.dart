import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/models/event_model.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/services/scripts/ipagePikerCreater.dart';
import 'package:rte_cubit/widgets/scan_bar.dart';

class InputText extends StatefulWidget {
  var imageFile;
  var event_id;

  InputText({this.event_id, this.imageFile});
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool activeBtn = true;
  EventController controller = Get.find();

  var controllerT = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.userAvatar.refresh();
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              controller.userAvatar.value,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          onPressed: () async {
                            Navigator.pop(context);

                            widget.imageFile = await ImageCreates()
                                .PikerLodgick(
                                    isVideo: false, source: ImageSource.camera);

                            setState(() {
                              controller.image = File(widget.imageFile.path);
                            });
                          }),
                      IconButton(
                          icon: Icon(Icons.add_photo_alternate),
                          onPressed: () async {
                            Navigator.pop(context);

                            widget.imageFile = await ImageCreates()
                                .PikerLodgick(
                                    isVideo: false,
                                    source: ImageSource.gallery);
                            setState(() {
                              controller.image = File(widget.imageFile.path);
                            });
                          }),
                    ],
                  );
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: kYellowColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        // First child is enter comment text input
        Flexible(
          child: Stack(
            children: [
              TextField(
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 30, 0),
                  hintText: "О чем Вы думаете?",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                controller: controllerT,
              ),
              Positioned(
                  right: -2,
                  bottom: 2,
                  child: controller.image == null
                      ? Text('')
                      : CircleAvatar(
                          backgroundImage: FileImage(controller.image),
                          maxRadius: 20,
                        ))
            ],
          ),
        ),
        SizedBox(
          width: 3,
        ),
        activeBtn
            ? FloatingActionButton(
                onPressed: () async {
                  try {
                    /* Timer(Duration(seconds: 2), () {
                      controller.scrollController.jumpTo(
                          controller.scrollController.position.maxScrollExtent);
                    });*/

                    if (widget.imageFile != null) {
                      File file = File(widget.imageFile.path);
                      Uint8List bytes = file.readAsBytesSync();

                      String img64 = base64Encode(bytes);

                      print(
                          "description: widget.controllerT.text == null ${controllerT.text.isEmpty}");
                      if (controllerT.text.isEmpty) {
                        snacBars(
                            text: "Введите подпись!",
                            color: Colors.red,
                            context: context,
                            duration: Duration(milliseconds: 600));
                      } else {
                        setState(() {
                          activeBtn = false;
                          Timer(Duration(seconds: 2), () {
                            setState(() {
                              activeBtn = true;
                            });
                          });
                          controller.image = null;
                        });
                        snacBars(
                            text: "Публикация поста",
                            color: Colors.green[100],
                            context: context,
                            duration: Duration(milliseconds: 600));
                        final eventData = DatumComent(
                            description: controllerT.text,
                            imageUrl: img64,
                            type: "jpg");
                        final result = await controller.send(
                            item: eventData, event_id: widget.event_id);
                        controllerT.clear();
                      }

                      FocusScope.of(context).requestFocus(new FocusNode());
                    } else {
                      setState(() {
                        activeBtn = false;
                        Timer(Duration(seconds: 2), () {
                          setState(() {
                            activeBtn = true;
                          });
                        });
                        controller.image = null;
                      });
                      final eventData = DatumComentTxt(
                        description: controllerT.text.toString(),
                      );
                      snacBars(
                          text: "Публикация поста",
                          color: Colors.green[100],
                          context: context,
                          duration: Duration(milliseconds: 600));
                      final result = await controller.sendTxt(
                          item: eventData, event_id: widget.event_id);

                      FocusScope.of(context).requestFocus(new FocusNode());
                      controllerT.clear();
                    }
                  } catch (e) {
                    print("22222222222 $e");
                  }
                },
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: kYellowColor,
                elevation: 0,
              )
            : FloatingActionButton(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 25,
                ),
                backgroundColor: kAppBarColot,
                elevation: 0,
              ),
      ]),
    );
  }
}
