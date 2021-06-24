import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/widgets/list_bulder_contacts.dart';

class EventContact extends GetView<EventController> {
  TextEditingController searchController = TextEditingController();

  String searchString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Учаснки",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: GetX<EventController>(
        initState: (state) => Get.find<EventController>(),
        builder: (data) {
          print("dataaaaaaaaaaaaaaaaaaaaa  ${data.eventContactLict.isEmpty}");
          return data.eventContactLict.isEmpty
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
                          data.eventContactLict.refresh();
                        },
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                          itemCount: data.eventContactLict.length,
                          itemBuilder: (context, index) {
                            var article = data.eventContactLict[index];

                            /*    if (index == data.eventContactLict.length - 1 &&
                                controller.isMoreDataAvailable2.value == true) {
                              return Center(child: CircularProgressIndicator());
                            }*/
                            print(
                                "avata ${data.eventContactLict[index].avatarUrl}");
                            print(
                                "dataaaaaaaaaaaaaaaaaaaaa  ${data.eventContactLict.length}");
                            return ListBuilContacts(
                              data: data.eventContactLict[index],
                            );

                            /*article.firstName
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
                                : Container();*/
                          }),
                    )
                  ],
                );
        },
      ),
    );
  }
}
