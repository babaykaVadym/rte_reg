/*
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/tickets_controller.dart';
import 'package:rte_cubit/pages/parson_draw/prof_draw.dart';
import 'package:rte_cubit/pages/tiket/tickets_widgets.dart';

import 'notification_screen.dart';

class TiketsPage extends StatefulWidget {
  @override
  _TiketsPageState createState() => _TiketsPageState();
}

class _TiketsPageState extends State<TiketsPage> {
  TicketsController ticketsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: ProfilDraws(0),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Билеты",
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    Get.to(NotificationsScreen());
                  })
            ],
            bottom: TabBar(tabs: [
              Tab(
                child: Text("New ${ticketsController.countNew.value}",
                    style: Theme.of(context).textTheme.headline1),
              ),
              Tab(
                child: Text("Bying ${ticketsController.countBting.value}",
                    style: Theme.of(context).textTheme.headline1),
              ),
              Tab(
                child: Text("Old ${ticketsController.countOld.value}",
                    style: Theme.of(context).textTheme.headline1),
              ),
            ]),
          ),
          body: TabBarView(children: [
            Container(child: _lisB(data: ticketsController, ints: 0)),
            Container(child: _lisB(data: ticketsController, ints: 1)),
            Container(child: _lisB(data: ticketsController, ints: 2))
          ]),
        ));
  }
}

Widget _lisB({data, ints}) {
  return Obx(() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 1,
      itemCount: data.ticketsList.length,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      itemBuilder: (context, index) {
        switch (ints) {
          case 0:
            if (data.ticketsList[index].status.status == "new") {
              return TicketsWidgets(
                ticketModel: data.ticketsList[index],
              );
            }
            break;
          case 1:
            if (data.ticketsList[index].status.status != "new") {
              return TicketsWidgets(
                ticketModel: data.ticketsList[index],
              );
            }
            break;
          case 2:
            return Center(
              child: Container(),
            );
            break;
        }
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    );
  });
}
*/
