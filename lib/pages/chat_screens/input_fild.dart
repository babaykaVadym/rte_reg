import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphy_get/giphy_get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rte_cubit/controllers/chat/masseg_controller.dart';
import 'package:rte_cubit/models/chat_model/chat_dio.dart';
import 'package:rte_cubit/services/consts.dart';

class InputFildChat extends StatefulWidget {
  ScrollController scrollController;
  InputFildChat(this.scrollController);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<InputFildChat> {
  MessegeController messegeController = Get.find();

  GiphyGif currentGif;
  String giphy_api_key = "CiImTrH10Z54rO8pIysoYApS8mH5xdjN";
  PickedFile _imageFile, videoFail;
  dynamic _pickImageError;
  bool isVideo = false;

  var controller = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: <Widget>[
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
                            onPressed: () {
                              Navigator.pop(context);
                              isVideo = false;
                              _onImageButtonPressed(ImageSource.camera,
                                  context: context);
                            }),
                        /*IconButton(
                            icon: Icon(Icons.video_call_outlined),
                            onPressed: () {
                              isVideo = true;
                              _onImageButtonPressed(ImageSource.camera);
                            }),*/
                        IconButton(
                            icon: Icon(Icons.add_photo_alternate),
                            onPressed: () {
                              Navigator.pop(context);
                              isVideo = false;
                              _onImageButtonPressed(ImageSource.gallery,
                                  context: context);
                            }),
                        /*  IconButton(
                            icon: Icon(Icons.video_call_sharp),
                            onPressed: () {
                              isVideo = true;
                              _onImageButtonPressed(ImageSource.gallery);
                            }),*/
                        IconButton(
                          icon: Icon(Icons.gif),
                          onPressed: () async {
                            GiphyGif gif = await GiphyGet.getGif(
                              context: context,
                              apiKey: giphy_api_key, //YOUR API KEY HERE
                              lang: GiphyLanguage.russian,
                            );
                            if (gif != null && mounted) {
                              setState(() {
                                currentGif = gif;

                                messegeController.sendMessege(
                                    messege:
                                        "gif#${currentGif.images.original.url}");
                                Timer(
                                    Duration(seconds: 2),
                                    () => widget.scrollController.jumpTo(widget
                                        .scrollController
                                        .position
                                        .maxScrollExtent));
                                Navigator.pop(context);
                              });
                            }
                          },
                        ),
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
            width: 15,
          ),
          Expanded(
            child: Stack(children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Write message...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
              Positioned(
                  right: -2,
                  bottom: 2,
                  child: _imageFile == null
                      ? Text('')
                      : CircleAvatar(
                          backgroundImage: FileImage(File(_imageFile.path)),
                          maxRadius: 16,
                        ))
            ]),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: () async {
              if (_imageFile == null) {
                setState(() {
                  messegeController.sendMessege(messege: controller.text);
                  Timer(
                      Duration(seconds: 2),
                      () => widget.scrollController.jumpTo(
                          widget.scrollController.position.maxScrollExtent));
                  FocusScope.of(context).requestFocus(new FocusNode());
                  controller.clear();
                });
              } else {
                await chatDio().uploadFileAsFormData(_imageFile.path,
                    controller.text, messegeController.id.value);

                setState(() {
                  Timer(Duration(seconds: 3), () {
                    widget.scrollController.jumpTo(
                        widget.scrollController.position.maxScrollExtent);
                    _imageFile = null;
                  });
                  controller.clear();
                  FocusScope.of(context).requestFocus(new FocusNode());
                });
              }

              setState(() {});
            },
            child: Icon(
              Icons.send,
              color: Colors.white,
              size: 25,
            ),
            backgroundColor: kYellowColor,
            elevation: 0,
          ),
        ],
      ),
    );
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
/*    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }*/
    if (isVideo) {
      final PickedFile file = await _picker.getVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      setState(() {
        videoFail = file;
      });
      //await _playVideo(file);
    } else {
      try {
        final pickedFile = await _picker.getImage(
          imageQuality: 30,
          source: source,
        );
        setState(() {
          _imageFile = pickedFile;
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }
}
