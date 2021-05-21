import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/ticket/tiket_dop_controler.dart';

class LoadDopMaterial extends GetView<TicketDopController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Дополнительние материалы",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Container(
          child: controller.obx(
            (data) => ListView.builder(
                itemCount: data.data.length,
                itemBuilder: (context, index) {
                  print("data.data[index] ${data.data.length}");

                  var file = data.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.insert_drive_file),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            file.name,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}
