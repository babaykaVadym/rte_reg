import 'package:get/state_manager.dart';
import 'package:rte_cubit/models/load_dop_model.dart';
import 'package:rte_cubit/services/tickets/tiket_dop_api.dart';

class TicketDopController extends GetxController with StateMixin<LoadDopModel> {
  @override
  void fetchFile({event_id, tiket_id, hash_id}) async {
    // TODO: implement onInit
    await TicketDopApi()
        .getFile(event_id: event_id, hash_id: hash_id, tiket_id: tiket_id)
        .then((value) {
      change(value, status: RxStatus.success());
      //
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }
}
