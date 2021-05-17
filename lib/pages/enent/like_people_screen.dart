import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/widgets/list_bulder_contacts.dart';

class LikePeopele extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Кому понравилось",
            style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print(UserController().userContactDat.length);
                //  Get.to(NotificationsScreen());
              })
        ],
      ),
      body: GetX<EventController>(
        initState: (state) => Get.find<EventController>(),
        builder: (data) {
          return data.eventListLikes.length == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child: ListView.builder(
                          itemCount: data.eventListLikes.length,
                          itemBuilder: (context, index) {
                            var article = data.eventListLikes[index];
                            print("data ${data.eventListLikes.length}");
                            return ListBuilContacts(
                              data: data.eventListLikes[index],
                            );
                          }),
                    )
                  ],
                );
        },
      ),
    );
  }
}

