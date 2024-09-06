

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:libphonenumber/libphonenumber.dart';

import '../../../models/response_api.dart';
import '../../../models/user.dart';
import '../../../providers/users_provider.dart';

class PhoneRegisterController extends GetxController {

  UsersProvider usersProvider = UsersProvider();

  var phoneNumber = "".obs;
  var completePhoneNumber = "".obs;
  var isoCode = "MX".obs;
  var countryCode = "52".obs;

  User user = User.fromJson(GetStorage().read('user'));

  RxBool isLoading = false.obs;

  void back() {
    Get.back();
  }



  void next() async {
    isLoading.value = true;
    bool isValid = await isValidNumberPhone();
    print('${countryCode}1${phoneNumber.value}');

    if(isValid){
      ResponseApi responseaApi = await usersProvider.sendCodeNumberPhone(user.id?? '0', completePhoneNumber.value);

      if(responseaApi.success == true){
        Get.toNamed('/register/phone/verification', arguments: {
          'phone': '${completePhoneNumber.value}',
        });
      }else{
        Get.snackbar("Error", responseaApi.message ?? '');
      }
    }

    isLoading.value = false;
  }

  Future<bool> isValidNumberPhone() async {
    print('phoneNumber.value: ${phoneNumber.value}');
    print('phoneNumber.value.length: ${phoneNumber.value.length}');

    if(phoneNumber.value.isEmpty){
      Get.snackbar("Telefono invalido", "Debes ingresar tu número de teléfono");
      return false;
    }

    if(phoneNumber.value.length < 10){
      Get.snackbar("Telefono invalido", "Debes ingresar un número de teléfono válido");
      return false;
    }

    var isValid = await PhoneNumberUtil.isValidPhoneNumber(
      phoneNumber: completePhoneNumber.value,
      isoCode: isoCode.value,
    );

    if(!isValid!){
      Get.snackbar("Formulario no valido", "Debes ingresar un número de teléfono válido");
      return false;
    }

    print('complete phone number: ${completePhoneNumber.value}');
    print('isoCode: ${isoCode.value}');



    return true;
  }

  void goToClient() {
    Get.offNamedUntil("/client", (route) => false);
  }
}