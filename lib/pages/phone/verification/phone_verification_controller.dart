


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/response_api.dart';
import '../../../models/user.dart';
import '../../../providers/users_provider.dart';

class PhoneVerificationController extends GetxController {

  var verificationCode = ''.obs;
  var isLoading = false.obs;

  String phoneNumber =  Get.arguments['phone'] ?? '';


  UsersProvider usersProvider = UsersProvider();

  User user = User.fromJson(GetStorage().read('user'));


  void back() {
    Get.back();
  }

  // Simulación del servicio de verificación de teléfono
  void verifyPhoneNumber(String code) async {
    isLoading.value = true;

    ResponseApi responseApi = await usersProvider.numberPhoneVerify(user.id ?? '0', code);

    isLoading.value = false;

    if (responseApi.success ?? false) {
      GetStorage().write('user', responseApi.data);// Datos del usuario en sesión
      print("GetStorage, User: ${responseApi.data}");
      Get.snackbar("Verificado", responseApi.message ?? '');
      if (user.role == 'CLIENTE') {
        goToClientPage();
      } else if (user.role == 'BARBERO') {
        goToBarberPage();
      }

    } else {
      Get.snackbar("Error", responseApi.message ?? '');
    }
  }

  void goToClientPage() {
    Get.offNamedUntil('/client', (route) => false);
  }

  void goToBarberPage(){
    Get.offNamedUntil('/barber', (route) => false);
  }






}