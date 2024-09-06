


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/response_api.dart';
import '../../../providers/users_provider.dart';

class PasswordRecoveryUpdateController extends GetxController {


  var isLoading = false.obs;

  var passwordController = TextEditingController();
  RxBool showPassword = false.obs;

  var confirmPasswordController = TextEditingController();
  RxBool showConfirmPassword = false.obs;

  UsersProvider usersProvider = UsersProvider();

  //get toke from arguments
  final String token = Get.arguments['token'];

  void changePassword() async {
    isLoading.value = true;

    var password = passwordController.text.trim();
    var confirmPassword = confirmPasswordController.text.trim();


    if(isValidForm(password, confirmPassword)){

      ResponseApi responseApi = await usersProvider.updatePassword(password, token);
      isLoading.value = false;
      print("ResponseApi: ${responseApi.toJson()}");


      if(responseApi.success == true){
        Get.snackbar("Contraseña cambiada", "👍");
        Get.offAllNamed('/login');
      }else{
        Get.snackbar("${responseApi.message ?? ''}", "🫠");
      }

    }

    isLoading.value = false;



  }

  bool isValidForm(String password, String confirmPassword) {
    if(password.isEmpty || confirmPassword.isEmpty){
      Get.snackbar("Todos los campos son obligatorios", "🫠");
      return false;
    }

    if(password != confirmPassword){
      Get.snackbar("Las contraseñas no coinciden", "🫠");
      return false;
    }

    return true;
  }

}