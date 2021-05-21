import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rte_cubit/models/tickets/upgrade_ticket_model.dart';

import '../consts.dart';

class TicketUpgradeApi {
  Future<List<UpgradeTicketModel>> getUpgrate({event_id, tiket_id}) async {
    var client = http.Client();

    var response = await client.get(
        Uri.parse(kUrlApi + 'events/$event_id/orders/$tiket_id/tickets'),
        headers: requestHeaders);
    print(response.statusCode);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse
          .map((job) => new UpgradeTicketModel.fromJson(job))
          .toList();
    } else {
      //show error message
      return null;
    }
  }
}
