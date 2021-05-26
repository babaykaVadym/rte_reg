import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rte_cubit/models/user_model.dart';
import 'package:rte_cubit/services/consts.dart';

class UserData {
  // UserController userController = Get.find();

  Future<UserModel> getUserData() async {
    var client = http.Client();
    var userModel;

    var response = await client.get(Uri.parse(kUrlApi + 'showProfile?page=1'),
        headers: requestHeaders);
    print(response.statusCode);
    print(response.body);
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    userModel = UserModel.fromJson(jsonMap);

    return userModel;
  }

  Future<UserModel> setUserData(var item) async {
    var client = http.Client();
    var userModel;

    var request = await client.put(Uri.parse(kUrlApi + 'updateProfile'),
        headers: requestHeaders, body: json.encode(item.toJson()));

    print(request.statusCode);
    print(request.body);
  }

  Future<UserModel> getIdUser(id) async {
    var client = http.Client();
    var userModel;

    var response = await client.get(Uri.parse(kUrlApi + 'users/$id'),
        headers: requestHeaders);

    var jsonString = response.body;

    try {
      if (response.statusCode == 200) {
        var jsonMap = json.decode(jsonString);
        userModel = UserModel.fromJson(jsonMap);

        return userModel;
      } else {
        return null;
        //   userController.notFound.value = false;
      }
    } catch (e) {
      print(e);
      return null;
      //  userController.notFound.value = false;
    }
  }
}
