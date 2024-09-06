

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeController extends GetxController {



  void goToLoginPage() {
    Get.toNamed('/login');
  }

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

}