import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/models/user_model.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageLoaded extends StatefulWidget {
  @override
  _ImageLoadedState createState() => _ImageLoadedState();
}

class _ImageLoadedState extends State<ImageLoaded> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  UserController userController = Get.find();

  File _image, image2;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 60);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Select FOTO');
      }
    });
  }

  Future getImageG() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 60);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Select FOTO');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Загрузка фотографии',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  userController.UserD.value.avatarUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                backgroundColor: kAppBarColot,
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: getImageG,
                tooltip: 'Pick Image',
                child: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.black,
                ),
                backgroundColor: kAppBarColot,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width / 1.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height / 2.23),
              color: kYellowColor,
            ),
            child: TextButton(
                onPressed: () async {
                  //SaveImg();
                  File file = File(_image.path);
                  Uint8List bytes = file.readAsBytesSync();

                  String img64 = base64Encode(bytes);
                  final fotoData = UserFotoUpdate(avatar: img64, type: "png");
                  final result =
                      await UserController().updateUserProfile(fotoData);
                  userController.onInit();
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save_alt,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Утановить фотографию",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
//_image == null ? Text('No image selected.') : Image.file(_image),
