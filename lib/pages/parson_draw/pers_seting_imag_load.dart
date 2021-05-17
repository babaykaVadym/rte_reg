import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/user_image_widgets.dart';
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

  Future SaveImg() async {
    final SharedPreferences prefs = await _prefs;
    File file = File(_image.path);
    Uint8List bytes = file.readAsBytesSync();

    String img64 = base64Encode(bytes);

    await prefs.setString('img64', img64);
    UserImageWidgets().createState().LoadImg();
    Get.back();
  }

  /*Future SaveImg() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    final File newImage = await _image.copy('$appDocPath/logo.png');
    print(newImage);
    setState(() {
      UserController.imgPath = newImage;
      userController.fetchUserLogo();
      Get.off(HomeScreen());
    });
  }*/

  /* Future loadImg() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    final File newImage = await File('$appDocPath/logo.png');
    print(image2);
    setState(() {
      image2 = newImage;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Загрузка фотографии'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: _image == null
                ? new CircleAvatar(
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 150,
                    ),
                    backgroundColor: kAppBarColot,
                    radius: 150.0,
                  )
                : new CircleAvatar(
                    backgroundImage: new FileImage(_image),
                    radius: 150.0,
                  ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                backgroundColor: kAppBarColot,
                child: Icon(Icons.add_a_photo),
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: getImageG,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_photo_alternate),
                backgroundColor: kAppBarColot,
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                SaveImg();
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
                  Text("Утановить фотографию")
                ],
              ))
        ],
      ),
    );
  }
}
//_image == null ? Text('No image selected.') : Image.file(_image),
