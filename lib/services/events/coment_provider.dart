import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rte_cubit/models/coment_model.dart';

import '../consts.dart';

class ComentProvider {
  Future<List<ComentModel>> getComentData(event_id, coment_id) async {
    var client = http.Client();

    var response = await client.get(
        Uri.parse(kUrlApi + 'events/$event_id/posts/$coment_id/comments'),
        headers: requestHeaders);

    final List<dynamic> comentsJson = json.decode(response.body);
    return comentsJson.map((json) => ComentModel.fromJson(json)).toList();
  }

  Future<ComentModel> setdComentData(
      event_id, coment_id, ComentModel item) async {
    var request = await http.post(
        Uri.parse(kUrlApi + 'events/$event_id/posts/$coment_id/comments'),
        headers: requestHeaders,
        body: json.encode(item.toJson()));
  }

  Future<ComentModel> setdLike(event_id, coment_id, coments_id) async {
    var request = await http.post(
      Uri.parse(kUrlApi +
          'events/$event_id/posts/$coment_id/comments/$coments_id/like'),
      headers: requestHeaders,
    );
  }

  Future<ComentModel> setdUnLike(event_id, coment_id, coments_id) async {
    var request = await http.post(
      Uri.parse(kUrlApi +
          'events/$event_id/posts/$coment_id/comments/$coments_id/unlike'),
      headers: requestHeaders,
    );
  }
}
