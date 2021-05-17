import 'package:get/get.dart';
import 'package:rte_cubit/models/coment_model.dart';
import 'package:rte_cubit/services/events/coment_provider.dart';

class ComentController extends GetxController
    with StateMixin<List<ComentModel>> {
  var event_id = 0.obs;
  var coment_id = 0.obs;
  var isLoading = true.obs;
  var UserId = 0.obs;
  final comentsLists = RxList();
  get comentsList => this.comentsLists.value;
  set comentsList(value) => this.comentsLists.value = value;

  // final likesPeoleList = RxList();

  void fetchComent() async {
    try {
      print(" coment_id coment_id $coment_id");
      isLoading(true);
      var coment = await ComentProvider().getComentData(event_id, coment_id);
      if (coment != null) {
        comentsList = coment as List<ComentModel>;
        //this.comentsList.refresh();
      }
    } finally {
      isLoading(false);
    }
  }

  /* send({ComentModel item, event_id, coment_id}) async {
    await ComentProvider().setdComentData(event_id, coment_id, item);
    Get.put(EventController());

    EventController().eventListM.refresh();

    fetchComent();

    comentsLists.refresh();
  }*/

  like(coments_id) async {
    await ComentProvider().setdLike(event_id, coment_id, coments_id);
    fetchComent();
    //  eventListM.refresh();
  }

  Unlike(coments_id) async {
    await ComentProvider().setdUnLike(event_id, coment_id, coments_id);
    fetchComent();
    //  eventListM.refresh();
  }
}