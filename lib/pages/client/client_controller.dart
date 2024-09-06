import 'package:cafeteria_revolucion/models/user.dart';
import 'package:cafeteria_revolucion/providers/push_notifications_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientController extends GetxController{

  PushNotificationsProvider pushNotificationsProvider = PushNotificationsProvider();
  User user = User.fromJson(GetStorage().read('user') ?? {});

  RxInt currentPageIndex = 0.obs;

  ClientController(){
    saveToken();
  }

  void saveToken(){
    print("SAVE TOKEN");
    if(user.id != null){
      pushNotificationsProvider.saveToken(user.id??"", user.tokenPush??"");
    }
  }

}
