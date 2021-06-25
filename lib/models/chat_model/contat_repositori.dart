import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rte_cubit/services/consts.dart';

import 'contact_modal.dart';

class ContactReositori {
  Future<List<ContactModel>> getEventData() async {
    var client = http.Client();
    var eventModel;
    var response = await client.post(
        Uri.parse(kUrlApiChat + 'chatify/getContacts'),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['contacts'];

      return jsonResponse.map((job) => new ContactModel.fromJson(job)).toList();
    } else {
      //show error message
      return null;
    }
  }

  Future<void> sendTokenFMC({String token}) async {
    var client = http.Client();
    var requestBody = jsonEncode({
      'token': token,
    });
    var response = await client.post(
        Uri.parse('https://a3.rte.im/chatify/saveDeviceToken'),
        headers: requestHeaders,
        body: requestBody);

    print("send token ${response.body}");
    print("send token ${response.statusCode}");
  }
}
