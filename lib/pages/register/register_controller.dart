import 'package:cafeteria_revolucion/models/response_api.dart';
import 'package:cafeteria_revolucion/providers/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';

import '../../models/user.dart';
import '../../providers/google_provider.dart';



class RegisterController extends GetxController {

  RxBool isLoading = false.obs;

  GoogleProvider googleProvider = GoogleProvider();


  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void goToLoginPage() {
  Get.back();
  Get.toNamed('/login');
  }


  Future<void> continueWithGoogle() async {
    try {
      GoogleAuthData? account = await googleProvider.loginGoogle();

      if (account == null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text("No se pudo iniciar sesión con Google")));
        return;
      }

      ResponseApi responseApi = await usersProvider.loginWithGoogle(account);

      if (responseApi.success == true) {
        GetStorage().write(
            'user', responseApi.data); // Datos del usuario en sesión
        print("GetStorage, User: ${responseApi.data}");

        goToClientPage();

      } else {
        Get.snackbar("Login fallido", responseApi.message ?? '');
      }
    }catch(e){
      print("Error : $e");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text("No se pudo iniciar sesión con Google")));
    }
  }

  Future<void> register(BuildContext context) async {
      isLoading.value = true;

      String email = emailController.text.trim();
      String name = nameController.text;
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      if(isValidForm(email, name, password, confirmPassword)){

        ResponseApi responseApi = await usersProvider.create(email, name, password);
        isLoading.value = false;

        if(responseApi.success == true){
          GetStorage().write('user', responseApi.data);

         // User user = User.fromJson(responseApi.data);
          //FALTA guardar push token
          goToClientPage();
       }else{
          Get.snackbar("Registro fallido", responseApi.message ?? '');
        }

      }
      isLoading.value = false;
  }

  bool isValidForm(String email, String name, String password, String confirmPassword) {
    if(email.isEmpty || name.isEmpty || password.isEmpty || confirmPassword.isEmpty){
      Get.snackbar("Campos vacíos", "Por favor, rellene todos los campos");
      return false;
    }else if(password != confirmPassword){
      Get.snackbar("Contraseñas no coinciden", "Por favor, verifique las contraseñas");
      return false;
    }else if(password.length < 6){
      Get.snackbar("Contraseña muy corta", "La contraseña debe tener al menos 6 caracteres");
      return false;
    }
    return true;
  }

  void goToClientPage() {
    Get.offNamedUntil('/client', (route) => false);
  }




}