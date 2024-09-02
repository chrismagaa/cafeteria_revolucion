import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/response_api.dart';
import '../../providers/users_provider.dart';


class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

    void goToRegisterPage(){
      Get.toNamed('/register');
    }

    void goToClientPage(){
      Get.offNamedUntil("/client", (route) => false);
    }

    void login() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      print("Email: $email");
      print("Password: $password");


      if( isValidForm(email, password)){
        ResponseApi responseApi = await usersProvider.login(email, password);

        print("ResponseApi: ${responseApi.toJson()}");

        if(responseApi.success == true){
          GetStorage().write('user', responseApi.data);// Datos del usuario en sesión
          print("GetStorage, User: ${responseApi.data}" );

          if(responseApi.data['is_number_phone_verified'] == false){
           // goToNumberPage();
            goToClientPage();
          }else{
              goToClientPage();
          }
        }else{
          Get.snackbar("Login fallido", responseApi.message ?? '');
        }
      }
    }

  bool isValidForm(String email, String password){
    if(email.isEmpty){
      Get.snackbar("Formulario no valido", "Debes ingresar tu correo electronico");
      return false;
    }

    if(!GetUtils.isEmail(email)){
      Get.snackbar("Formulario no valido", "El correo electronico no es valido");
      return false;
    }

    if(password.isEmpty){
      Get.snackbar("Formulario no valido", "Debes ingresar tu contraseña");
      return false;
    }

    return true;
  }

  void goToNumberPage() {
    Get.offNamedUntil("/register/phone/number", (route) => false);
  }
}