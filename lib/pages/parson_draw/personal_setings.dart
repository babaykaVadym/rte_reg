import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/models/user_model.dart';
import 'package:rte_cubit/pages/enent/image_page.dart';
import 'package:rte_cubit/pages/parson_draw/pers_seting_imag_load.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/scan_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class PersonalSetings extends GetView<UserController> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  final _companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Профиль",
          style: TextStyle(color: kTextColors),
        ),
      ),
      body: GetX<UserController>(
          initState: (state) => Get.find<UserController>(),
          builder: (controller) {
            var data = controller.UserD.value;
            print(controller.UserD.value.id.toString());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ваше фото:",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(ImagePage(
                              urll: data.avatarUrl,
                            )),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.width / 2.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.network(
                                  data.avatarUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Flexible(child: Container()),
                          Container(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height / 2.23),
                              color: kYellowColor,
                            ),
                            child: TextButton(
                                onPressed: () async {
                                  Get.to(ImageLoaded());
                                },
                                child: Text(
                                  "Загрузить фото",
                                  style: Theme.of(context).textTheme.bodyText1,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                        child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Фамилия:",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                labelText: data.lastName,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Имя:",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: data.firstName,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Контактный номер:",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                labelText: data.telephoneNumber,
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Пароль:",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(labelText: "Пароль"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Компания:",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextFormField(
                              controller: _companyController,
                              decoration: InputDecoration(
                                labelText: data.company,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height / 2.23),
                        color: kYellowColor,
                      ),
                      child: TextButton(
                          onPressed: () async {
                            passW(data, context);
                            snacBars(
                                text: "Сохранение",
                                color: Colors.amberAccent,
                                context: context,
                                duration: Duration(milliseconds: 600));
                          },
                          child: Text(
                            "Сохранить",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            );
          }),
    );
  }

  void passW(data, context) async {
    final SharedPreferences prefs = await _prefs;

    var personSeting;
    if (_passwordController.text.isEmpty) {
      personSeting = UserUodate(
        firstName: _nameController.text.isEmpty
            ? data.firstName
            : _nameController.text,
        lastName: _lastNameController.text.isEmpty
            ? data.lastName
            : _lastNameController.text,
        telephoneCode: data.telephoneCode.toString(),
        telephoneNumber: _phoneController.text.isEmpty
            ? data.telephoneNumber.toString()
            : _phoneController.text.toString(),
        company: _companyController.text.isEmpty
            ? data.telephoneNumber.toString()
            : _companyController.text,
      );
      /* await prefs.setString(
        'usernamee',
        _mailController.text.isEmpty ? data.email : _mailController.text,
      );*/
    } else {
      personSeting = UserUodatePass(
        firstName: _nameController.text.isEmpty
            ? data.firstName
            : _nameController.text,
        lastName: _lastNameController.text.isEmpty
            ? data.lastName
            : _lastNameController.text,
        password: _passwordController.text,
        telephoneCode: data.telephoneCode.toString(),
        telephoneNumber: _phoneController.text.isEmpty
            ? data.telephoneNumber.toString()
            : _phoneController.text.toString(),
        company: _companyController.text.isEmpty
            ? data.telephoneNumber.toString()
            : _companyController.text,
      );
      await prefs.setString('passwordd', _passwordController.text);
    }

    final result = await controller.updateUserProfile(personSeting);
    controller.onInit();
    snacBars(
        text: "Сохранено",
        color: Colors.green,
        context: context,
        duration: Duration(milliseconds: 600));

    FocusScope.of(context).requestFocus(new FocusNode());
  }
}

Widget _RowsP(textFunk, textName) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(thickness: 2),
        Text(
          textName,
          style: TextStyle(fontSize: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              textFunk,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Flexible(child: Container()),
            TextButton(onPressed: () {}, child: Text("Изменить")),
          ],
        ),
      ],
    ),
  );
}
