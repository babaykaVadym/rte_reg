import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rte_cubit/models/load_dop_model.dart';

import '../consts.dart';

class TicketDopApi {
  Future<LoadDopModel> getFile({event_id, tiket_id, hash_id}) async {
    var client = http.Client();

    var response = await client.get(
        Uri.parse(kUrlApi +
            'events/$event_id/orders/$tiket_id/tickets/$hash_id/index-material-groups'),
        headers: requestHeaders);
    print(response.statusCode);

    var jsonMap = json.decode(response.body)['data'][0]['materials'];
    print(jsonMap);
    var loadDop = LoadDopModel.fromJson(jsonMap);
    return loadDop;
  }
}
