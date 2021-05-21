import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rte_cubit/models/user_model.dart';
import 'package:rte_cubit/services/consts.dart';

class UserData {
  List<UserData> userData = [];

  Future<UserModel> getUserData() async {
    var client = http.Client();
    var userModel;

    var response = await client.get(Uri.parse(kUrlApi + 'showProfile?page=1'),
        headers: requestHeaders);

    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    userModel = UserModel.fromJson(jsonMap);

    return userModel;
  }

  Future<List<Datum>> getContactUserData() async {
    var client = http.Client();

    var response = await client.get(Uri.parse(kUrlApi + 'showProfile?page=1'),
        headers: requestHeaders);
    try {
      List comentsJson = json.decode(response.body)['scans']['data'];

      return comentsJson.map((json) => new Datum.fromJson(json)).toList();
    } catch (e) {}

    //   return userModel;
  }

  Future<UserModel> setUserData(var item) async {
    var client = http.Client();
    var userModel;

    var request = await client.put(Uri.parse(kUrlApi + 'updateProfile'),
        headers: requestHeaders, body: json.encode(item.toJson()));
  }
}
