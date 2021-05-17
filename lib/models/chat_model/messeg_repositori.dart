import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rte_cubit/services/consts.dart';

import 'message_model.dart';

class MessegeReositori {
  Future<List<MessageModel>> getMessege(IdModel item) async {
    var client = http.Client();

    var response = await client.post(
        Uri.parse(kUrlApiChat + 'chatify/fetchMessages'),
        headers: requestHeaders,
        body: json.encode(item.toJson()));
    //, headers: requestHeaders

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['messages'];

      return jsonResponse.map((job) => new MessageModel.fromJson(job)).toList();
    } else {
      //show error message
      return null;
    }
  }

  Future<void> sendMessedge({String message, id}) async {
    var client = http.Client();
    var requestBody = jsonEncode({
      'message': message,
      'id': id,
      'type': 'user',
      'temporaryMsgId': 'temp_3'
    });
    var response = await client.post(
        Uri.parse(kUrlApiChat + 'chatify/sendMessage'),
        headers: requestHeaders,
        body: requestBody);
  }

  Future<void> makeSeen({id}) async {
    var client = http.Client();
    var requestBody = jsonEncode({
      'id': id,
    });
    var response = await client.post(
        Uri.parse(kUrlApiChat + 'chatify/makeSeen'),
        headers: requestHeaders,
        body: requestBody);
  }
}
