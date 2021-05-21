import 'package:get/get.dart';
import 'package:rte_cubit/models/tickets/upgrade_ticket_model.dart';
import 'package:rte_cubit/services/tickets/ticket_upgrade_api.dart';

class TicketUpgrateController extends GetxController
    with StateMixin<List<UpgradeTicketModel>> {
  var tiketUpgradeList = List<UpgradeTicketModel>().obs;

  void fetchUpgredaTicket({evnt_id, ticket_id}) async {
    var upgrade = await TicketUpgradeApi()
        .getUpgrate(event_id: evnt_id, tiket_id: ticket_id);
    if (upgrade != null) {
      tiketUpgradeList.value = upgrade as List<UpgradeTicketModel>;
      tiketUpgradeList.refresh();
    }
  }
}
