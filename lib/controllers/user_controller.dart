import 'package:get/get.dart';
import 'package:rte_cubit/models/user_model.dart';

//import 'package:path_provider/path_provider.dart';
import 'file:///D:/__flutter/rte_cubit/lib/services/user/user_data.dart';

class UserController extends GetxController with StateMixin<UserModel> {
  var UserD = UserModel().obs;
  static var imgPath;

  var loGos = "s".obs;

  var btnUScan = false.obs;
  var btnUScanBy = false.obs;
  var menuBtn = true.obs;
  var userIdnole = false.obs;
  var userId = UserModel().obs;
  var notFound = true.obs;

  var contactListNotestID = List<int>().obs;
  var contactDBList = List<UserModel>().obs;

  var contactSaveListID = List<int>().obs;
  var contactSvaveDBList = List<UserModel>().obs;

  @override
  void onInit() async {
    super.onInit();
    var user = await UserData().getUserData();

    UserD.value = user;
  }

  void updateUserProfile(var item) async {
    var events = await UserData().setUserData(item);
  }

  void getUserId(id) async {
    var user = await UserData().getIdUser(id);
    userId.value = user;
  }

  void getGBusetId(id) async {
    var user = await UserData().getIdUser(id);
    contactDBList.value.add(user);
  }

  void getContactSaveDB(id) async {
    var users = await UserData().getIdUser(id);
    contactSvaveDBList.value.add(users);
  }

  void serchQrCodeUser(event_id, orderId, ticketId) async {
    print("sssdaas awra $event_id # $orderId # $ticketId");

    var userIds = await UserData().getIdUserQr(event_id, orderId, ticketId);

    if (userIds != null && userIds != 0) {
      await getUserId(userIds);
    } else if (userIds == 0) {
      userIdnole.value = true;
    } else {
      userId.value = null;
    }
  }
}
