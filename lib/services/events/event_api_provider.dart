import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rte_cubit/controllers/event_controller.dart';
import 'package:rte_cubit/models/eventIdmodel.dart';
import 'package:rte_cubit/models/event_contact_model.dart';
import 'package:rte_cubit/models/event_model.dart';

import '../consts.dart';

class EventProvider {
  EventController eventController = Get.find();

  Future<List<DatumComent>> getEventData({event_id, var page}) async {
    var client = http.Client();
    var eventModel;
    var response = await client.get(
        Uri.parse(kUrlApi + 'events/$event_id/posts?paginate=true&page=$page'));
    //, headers: requestHeaders

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      return jsonResponse.map((job) => new DatumComent.fromJson(job)).toList();
    } else {
      //show error message
      return null;
    }
  }

  Future<EventIdModel> getEventIdData(event_id) async {
    var client = http.Client();
    var userModel;

    var response = await client.get(Uri.parse(kUrlApi + 'events/$event_id'),
        headers: requestHeaders);
    var jsonString = response.body;
    print(" 000000000000000000000000000000 $jsonString");
    print(" 000000000000000000000000000000 ${response.statusCode}");
    var jsonMap = json.decode(jsonString);

    userModel = EventIdModel.fromJson(jsonMap);

    return userModel;
  }

  /*Future<List<User>> getLikeUserData() async {
    var client = http.Client();
    var userModel;

    var response = await client
        .get(Uri.parse(kUrlApi + 'events/3200/posts?paginate=true'));

    List comentsJson = json.decode(response.body)['data'];
    print("jsonMap $comentsJson");
    return comentsJson.map((json) => new User.fromJson(json)).toList();

    //   return userModel;
  }*/

  Future<EventModel> setEventData(event_id, var item) async {
    var client = http.Client();

    var request = await client.post(
        Uri.parse(kUrlApi + 'events/$event_id/posts'),
        headers: requestHeaders,
        body: json.encode(item.toJson()));

    print("setEventData ${request.statusCode}");
    print("setEventData ${request.body}");
  }

  Future<DatumComent> setdLike(event_id, coment_id) async {
    var request = await http.post(
      Uri.parse(kUrlApi + 'events/$event_id/posts/$coment_id/like'),
      headers: requestHeaders,
    );
    print("setdLike ${request.statusCode}");
  }

  Future<DatumComent> setdUnLike(event_id, coment_id) async {
    var request = await http.post(
      Uri.parse(kUrlApi + 'events/$event_id/posts/$coment_id/unlike'),
      headers: requestHeaders,
    );
    print("setdUnLike ${request.statusCode}");
  }

  Future<EventModel> setEventDataIm(event_id, DatumComent item) async {
    var client = http.Client();
    var userModel;

    var request = await client.post(
        Uri.parse(kUrlApi + 'events/$event_id/posts'),
        headers: requestHeaders,
        body: json.encode(item.toJson()));
  }

  Future<List<EventContact>> getEventContact({event_id, var page}) async {
    var client = http.Client();
    var userModel;
    print("999999999999999999999999999999999999999999 $page");
    var response = await client.get(Uri.parse(
            /*kUrlApi + */ 'https://a3.rte.im/api/v1/events/$event_id/users?page=$page'),
        headers: requestHeaders);
    var jsonString = response.body;

    List jsonResponse = json.decode(response.body)['data'];
    eventController.pageContactTotalP.value =
        json.decode(response.body)['pagination']['total_pages'];
    print(
        " jsonMap  22222222222222222222222222222222 ${eventController.pageContactTotalP.value}");

    return jsonResponse.map((job) => new EventContact.fromJson(job)).toList();
  }
}
