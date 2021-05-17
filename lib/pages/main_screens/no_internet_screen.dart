import 'dart:ui';

import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              ///Bottom Image
              bottom: -10,

              child: Container(
                height: MediaQuery.of(context).size.height / 2.23,
                width: MediaQuery.of(context).size.height / 2.23,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 2.23),
                ),
                child: Image.asset('images/headerImg.png'),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 17.7,
              left: 0,
              right: 0,
              child: Center(
                child: new Image.asset(
                  'images/logo.png',
                  width: MediaQuery.of(context).size.width * .5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2, color: Colors.white),
                        color: Colors.white54,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Text(
                            "Нет подключения к интернету",
                            textAlign: TextAlign.center,
                            //  style: Theme.of(context).textTheme.headline1,
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
