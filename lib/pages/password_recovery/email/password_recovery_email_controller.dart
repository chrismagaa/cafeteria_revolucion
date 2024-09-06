


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/response_api.dart';
import '../../../providers/users_provider.dart';

class PasswordRecoveryEmailController extends GetxController {
  final emailController = TextEditingController();

  RxBool isLoading = false.obs;

  UsersProvider usersProvider = UsersProvider();

  void sendCode() async {
    isLoading.value = true;

    String email = emailController.text.trim();

    if(isValidForm(email)){

      ResponseApi responseApi = await usersProvider.sendCodePasswordRecovery(email);
      isLoading.value = false;

      print("ResponseApi: ${responseApi.toJson()}");

      if(responseApi.success == true){
        Get.snackbar("Código enviado", "📧");
        goToVerificationPage();
      }else{
        Get.snackbar("Error", responseApi.message!);
      }

    }
    isLoading.value = false;


  }

  bool isValidForm(String email){
    if(email.isEmpty){
      Get.snackbar("Ingresa tu correo electrónico", "🤭");
      return false;
    }

    if(!GetUtils.isEmail(email)){
      Get.snackbar("El correo electrónico no es valido", "🫠");
      return false;
    }

    return true;
  }

  void goToVerificationPage() {
    //send email to next page
    Get.toNamed('/password_recovery/verification',
        arguments: {'email': emailController.text});
  }


}