import 'package:get/state_manager.dart';
import 'package:rte_cubit/models/tickets_model.dart';
import 'package:rte_cubit/services/tickets/tickets_api_provider.dart';

class TicketsController extends GetxController
    with StateMixin<List<DatumData>> {
  var isLoading = true.obs;
  var isExpanded = true.obs;
  var ints = 0.obs;
  var btnNew = false.obs;
  var btnBuy = false.obs;
  var btnOld = false.obs;
  var ticketsList = List<DatumData>().obs;

  var newTicketsList = List<DatumData>().obs;
  var byingTicketsList = List<DatumData>().obs;
  var oldTicketsList = List<DatumData>().obs;
  var event_id = 0.obs;
  var tiket_id = 0.obs;
  //var LoadDopModel = LoadDopModel.obs;

  var now = new DateTime.now();

  void fetchTickets() async {
    try {
      isLoading(true);
      var tickets = await TicketsProvider().getTicket();
      if (tickets != null) {
        change(value, status: RxStatus.success());
        ticketsList.value = tickets as List<DatumData>;
        // LoadScrepss().RunTikets();
        oldTicketsList.value.clear();
        newTicketsList.value.clear();
        byingTicketsList.value.clear();
        for (int i = 0; i < ticketsList.length; i++) {
          if (ticketsList[i].event.eventEnd.millisecondsSinceEpoch <
              now.millisecondsSinceEpoch) {
            oldTicketsList.value.add(ticketsList[i]);
          } else {
            if (ticketsList[i].status.status == "new") {
              newTicketsList.value.add(ticketsList[i]);
            } else if (ticketsList[i].status.status != "new") {
              byingTicketsList.value.add(ticketsList[i]);
              print(byingTicketsList.length);
            }
          }
        }
        await oldTicketsList.refresh();
        await newTicketsList.refresh();
        await byingTicketsList.refresh();
      }
    } finally {
      isLoading(false);
    }
  }

  void sendTicketSettings({event_id, tiket_id, hash_id, Ticket item}) async {
    await TicketsProvider().setdSeting(
        event_id: event_id, tiket_id: tiket_id, hash_id: hash_id, item: item);
    await fetchTickets();
    ticketsList.refresh();
  }
}
