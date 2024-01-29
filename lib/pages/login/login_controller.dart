import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

    void goToRegisterPage(){
      Get.toNamed('/register');
    }

    void login(){
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
    }
}