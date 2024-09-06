



import 'package:get/get.dart';

import '../../../models/response_api.dart';
import '../../../providers/users_provider.dart';

class PasswordRecoveryVerificationController extends GetxController {

  var code = ''.obs;

  var isLoading = false.obs;

  //get email from arguments
  String email = Get.arguments['email'] ?? '';

  UsersProvider  usersProvider = UsersProvider();

  var timeResendCode = 60.obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if(timeResendCode.value > 0){
        timeResendCode.value = timeResendCode.value - 1;
        startTimer();
      }
    });
  }

  void resendCode() async {
    ResponseApi responseApi = await usersProvider.sendCodePasswordRecovery(email);

    if(responseApi.success == true){
      Get.snackbar("Código enviado", responseApi.message!);
      timeResendCode.value = 90;
      startTimer();
    }else{
      Get.snackbar("Error", responseApi.message!);
    }

  }


  void verifyCode(String code) async {
    isLoading.value = true;


    if(isValidCode(code)){
      var code = int.parse(this.code.value);

      ResponseApi responseApi = await usersProvider.verifyCodePassword(code, email);
      isLoading.value = false;

      print("ResponseApi: ${responseApi.toJson()}");

      if(responseApi.success == true){
        //get tooken from response

        var token = responseApi.data ?? '';

        goToUpdatePassword(token);

      }else{
        Get.snackbar("Error", responseApi.message!);
      }


    }


    isLoading.value = false;


  }


  bool isValidCode(String code){
    if(code.isEmpty){
      Get.snackbar("Ingresa el código", "🫠");
      return false;
    }

    if(code.length < 6){
      Get.snackbar("El código debe tener 6 dígitos", "🫠");
      return false;
    }

    //verificar si es entero
    try {
      int.parse(code);
    } catch (e) {
      Get.snackbar("El código debe ser un número", "🫠");
      return false;
    }

    return true;
  }

  void goToUpdatePassword(token) {
    Get.toNamed('/password_recovery/update', arguments: {'token': token});
  }



}


