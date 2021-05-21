import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/coment_controller.dart';
import 'package:rte_cubit/models/coment_model.dart';
import 'package:rte_cubit/pages/parson_draw/person_screen.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/user_image_widgets.dart';

class CommentWidgets extends StatelessWidget {
  ComentModel comet;
  ComentController comentController;
  CommentWidgets({this.comet, this.comentController});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.65;
    return GestureDetector(
      onTap: () {
        if (comet.user.id != Const.UserID) {
          Get.to(PersonScreen(
            namePerson: comet.user.firstName,
            company: comet.user.company,
            mailPerson: comet.user.email,
            telephone: comet.user.telephoneFullNumber,
            UserId: comet.user.id,
            nameSecPerson: comet.user.lastName,
          ));
        }
      },
      child: Container(
          margin: const EdgeInsets.all(5),
          //  padding: const EdgeInsets.symmetric(horizontal: 5),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                comet.user.id == comentController.UserId.value
                    ? UserImageWidgets()
                    : CircleAvatar(
                        child: Icon(
                          Icons.account_circle_rounded,
                          color: kYellowColor,
                          size: 35,
                        ),
                        backgroundColor: kAppBarColot,
                        maxRadius: 30,
                        minRadius: 15,
                      ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              comet.user.firstName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Container(
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(comet.comment),
                                  ],
                                )),
                            /*  Text(
                              comet.user.company,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Obx(() => TextButton(
                        child: Row(
                          children: [
                            Icon(
                              comet.isLikedComent.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "(${comet.likes.length})",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          if (comet.isLikedComent.value == false) {
                            comet.isLikedComent.toggle();

                            final result =
                                await comentController.like(comet.id);
                            print("resul likeeee ${comet.id}");
                          } else if (comet.isLikedComent.value == true) {
                            comet.isLikedComent.toggle();
                            final result =
                                await comentController.Unlike(comet.id);
                            print("resul UNNNNUUlikeeee");
                          }
                        },
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
