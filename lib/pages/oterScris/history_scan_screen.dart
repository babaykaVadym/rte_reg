import 'package:flutter/material.dart';

class HistoryScanScreen extends StatelessWidget {
  const HistoryScanScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "История сканирования",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          texB(
              name: "Итория людей которых Вы отсканировали",
              icon: Icons.people,
              onTap: () {},
              context: context),
          texB(
              name: "Итория людей которые Вас отсканировали",
              icon: Icons.perm_identity,
              onTap: () {},
              context: context),
        ],
      )),
    );
  }

  Widget texB({icon, name, onTap, context}) {
    return TextButton(
        onPressed: onTap,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 35,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ));
  }
}
