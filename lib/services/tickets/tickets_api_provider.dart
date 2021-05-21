import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rte_cubit/models/tickets_model.dart';

import '../consts.dart';

class TicketsProvider {
  Future<List<DatumData>> getTicket() async {
    var client = http.Client();
    var response = await client.get(Uri.parse(kUrlApi + 'events/orders'),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      return jsonResponse.map((job) => new DatumData.fromJson(job)).toList();
    } else {
      //show error message
      return null;
    }
  }

  Future<Ticket> setdSeting({event_id, tiket_id, hash_id, Ticket item}) async {
    var request = await http.put(
        Uri.parse(
            kUrlApi + 'events/$event_id/orders/$tiket_id/tickets/$hash_id'),
        headers: requestHeaders,
        body: json.encode(item.toJson()));
  }
}
