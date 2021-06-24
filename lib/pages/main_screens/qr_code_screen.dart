import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/pages/oterScreens/QR_code_menu.dart';

import 'notification_screen.dart';

class QrCodeScreen extends StatefulWidget {
  static appBar(context) => AppBar(
        centerTitle: true,
        title: Text("Сканер QR-кода",
            style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Get.to(NotificationsScreen());
              })
        ],
      );
  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;
  UserController userController = Get.find();

  bool camareOff = false;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  TextEditingController _controller = TextEditingController();
  String inputString = "";
  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 500 ||
            MediaQuery.of(context).size.height < 500)
        ? 300.0
        : 450.0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 40,
                  borderWidth: 10,
                  cutOutSize: scanArea),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 17,
            width: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height / 2.23),
              color: Colors.orangeAccent,
              /*gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white12, Colors.orangeAccent],
              ),*/
            ),
            // ignore: deprecated_member_use
            child: FlatButton(
              child: Text(
                "Ввести код",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Введите свой код"),
                      content: TextFormField(
                        controller: _controller,
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.pop(context, _controller.text);
                          },
                        )
                      ],
                    );
                  },
                ).then((val) {
                  setState(() {
                    //   inputString = val;
                  });
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 2.23),
                ),
                // ignore: deprecated_member_use
                child: FlatButton(
                  child: Text(
                    "Включить Камеру",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    controller.resumeCamera();
                    setState(() {
                      camareOff = false;
                    });
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 2.23),
                ),
                // ignore: deprecated_member_use
                child: FlatButton(
                  child: Text(
                    "Выключить Камеру",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    controller.pauseCamera();
                    setState(() {
                      camareOff = true;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                // ignore: deprecated_member_use
                child: FlatButton(
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        if (snapshot.data == true) {
                          return Icon(Icons.flash_off);
                        } else {
                          return Icon(Icons.flash_on);
                        }
                      },
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      try {
        controller.pauseCamera();
        List<String> mylist = result.code.split('?')[1].split('&');

        await userController.serchQrCodeUser(mylist[0].split('=')[1],
            mylist[1].split('=')[1], mylist[2].split('=')[1]);

        //  var res = int.parse(result.code.toString().split("/").last);
        Get.to(QrCodeMenu(
          faund: true,
        ));
      } catch (e) {
        controller.pauseCamera();
        Get.to(QrCodeMenu(
          faund: false,
        ));
      }

      setState(() {
        //controller.pauseCamera();

        //  userController.notFound.value = false;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
