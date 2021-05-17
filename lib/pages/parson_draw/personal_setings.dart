import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rte_cubit/controllers/user_controller.dart';
import 'package:rte_cubit/models/user_model.dart';
import 'package:rte_cubit/pages/parson_draw/pers_seting_imag_load.dart';
import 'package:rte_cubit/services/consts.dart';
import 'package:rte_cubit/widgets/user_image_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class PersonalSetings extends GetView<UserController> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _companyController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _mailController.dispose();
    _lastNameController.dispose();
    _companyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // controller.fetchUserLogo();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Профиль",
          style: TextStyle(color: kTextColors),
        ),
      ),
      body: controller.obx(
        (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ваше фото:",
              style: TextStyle(fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserImageWidgets(),
                Flexible(child: Container()),
                TextButton(
                    onPressed: () {
                      Get.to(ImageLoaded());
                    },
                    child: Text("Загрузить фото")),
              ],
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
                        Text("Фамилия:"),
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
                        Text("Имя:"),
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
                        Text("E-mail:"),
                        TextFormField(
                          controller: _mailController,
                          decoration: InputDecoration(labelText: data.email),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Контактный номер:"),
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
                        Text("Пароль:"),
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
                        Text("Компания:"),
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
            /*_RowsP(data.firstName, "Имя:"),
            _RowsP(data.lastName, "Фамилия:"),
            _RowsP(data.email, "E-mail"),
            _RowsP(data.telephoneFullNumber, "Контактный номер:"),
            _RowsP(data.company, "Компания:"),
            _RowsP("profile net dol", "Должность:"),*/
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
                      },
                      child: Text(
                        "Сохранить",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  void passW(data, context) async {
    final SharedPreferences prefs = await _prefs;
    print("_mailController.text ${_mailController.text.isEmpty}");
    var personSeting;
    if (_passwordController.text.isEmpty) {
      personSeting = UserUodate(
        firstName: _nameController.text.isEmpty
            ? data.firstName
            : _nameController.text,
        lastName: _lastNameController.text.isEmpty
            ? data.lastName
            : _lastNameController.text,
        email: _mailController.text.isEmpty ? data.email : _mailController.text,
        telephoneCode: data.telephoneCode.toString(),
        telephoneNumber: _phoneController.text.isEmpty
            ? data.telephoneNumber.toString()
            : _phoneController.text.toString(),
        company: _companyController.text.isEmpty
            ? data.telephoneNumber.toString()
            : _companyController.text,
      );
    } else {
      personSeting = UserUodatePass(
        firstName: _nameController.text.isEmpty
            ? data.firstName
            : _nameController.text,
        lastName: _lastNameController.text.isEmpty
            ? data.lastName
            : _lastNameController.text,
        password: _passwordController.text,
        email: _mailController.text.isEmpty ? data.email : _mailController.text,
        telephoneCode: data.telephoneCode.toString(),
        telephoneNumber: _phoneController.text.isEmpty
            ? data.telephoneNumber.toString()
            : _phoneController.text.toString(),
        company: _companyController.text.isEmpty
            ? data.telephoneNumber.toString()
            : _companyController.text,
      );
      await prefs.setString('passwordss', _passwordController.text);
    }
    print("UserUodate ${jsonEncode(personSeting)}");
    final result = await controller.updateUserProfile(personSeting);
    controller.onInit();
    print(prefs.getString("passwordss"));

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
