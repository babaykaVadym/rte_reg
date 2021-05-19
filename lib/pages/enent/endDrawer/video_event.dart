import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoEvemt extends StatelessWidget {
  String name;
  String url;
  VideoEvemt({this.name, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: WebView(
              initialUrl: "https://www.youtube.com/embed/${url}",
              javascriptMode: JavascriptMode.unrestricted),
        ),
      ),
    );
  }
}
