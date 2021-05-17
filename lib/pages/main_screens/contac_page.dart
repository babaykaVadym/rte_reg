import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/list_bulder_contacts.dart';

class ContactPage extends GetView<UserController> {
  static appBar(context) => AppBar(
        centerTitle: true,
        title: Text(
          "Контакты",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print(Const.token);
                //  Get.to(NotificationsScreen());
              })
        ],
      );

  TextEditingController searchController = TextEditingController();

  String searchString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetX<UserController>(
        initState: (state) => Get.find<UserController>(),
        builder: (data) {
          print("data ${data.userContactDat.length}");

          return data.userContactDat.length == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            labelText: "Поиск",
                            hintText: "Поиск",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)))),
                        onChanged: (text) {
                          text = text.toLowerCase();
                          print(searchString);
                          searchString = text;
                          data.userContactDat.refresh();
                        },
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                          itemCount: data.userContactDat.length,
                          itemBuilder: (context, index) {
                            var article = data.userContactDat[index];
                            return article.firstName
                                        .toLowerCase()
                                        .contains(searchString) ||
                                    article.lastName
                                        .toLowerCase()
                                        .contains(searchString) ||
                                    article.company
                                        .toLowerCase()
                                        .contains(searchString)
                                ? ListBuilContacts(
                                    data: data.userContactDat[index],
                                  )
                                : Container();
                          }),
                    )
                  ],
                );
        },
      ),
    );
  }
}
