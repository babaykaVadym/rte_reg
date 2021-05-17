import 'package:get/get.dart';
import 'package:rte_cubit/models/user_model.dart';

//import 'package:path_provider/path_provider.dart';
import 'file:///D:/__flutter/rte_cubit/lib/services/user/user_data.dart';

class UserController extends GetxController with StateMixin<UserModel> {
  //var UserDataCont = UserModel.obs;
  static var imgPath;

  var loGos = "s".obs;
  var userContactDat = RxList();
  get contacttList => this.userContactDat.value;
  set contacttList(value) => this.userContactDat.value = value;

  @override
  void onInit() {
    super.onInit();
    UserData().getUserData().then((value) {
      change(value, status: RxStatus.success());
      //
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }

  /*void fetchUserLogo() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    final File newImage = await File('$appDocPath/logo.png');

    newImage.existsSync() ? imgPath = newImage : null;
  }*/

  void fetchUserContats() async {
    var events = await UserData().getContactUserData();

    if (events != null) {
      RxStatus.success();

      userContactDat.value = events as List<Datum>;
    }
    /*UserData()
        .getContactUserData()
        .then((value) => this.userContactDat = value);*/
  }

  void updateUserProfile(var item) async {
    var events = await UserData().setUserData(item);
    onInit();
  }

  /* void fetchUserData() async {
    var user = await UserData().getUserData();
    UserDataCont.value = user;
  }*/
}
