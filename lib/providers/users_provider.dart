import 'package:cafeteria_revolucion/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../environment/environment.dart';
import '../models/response_api.dart';
import 'google_provider.dart';

class UsersProvider extends GetConnect {

  String url = Environment.API_URL + "users";

  User userSession = User.fromJson(GetStorage().read('user') ?? {});


  /*
  Future<ResponseApi> loginWithGoogle(GoogleAuthData account) async {

    Response response = await post('$url/loginWithGoogle',
        account.toJson(),
        headers: {
          'Content-Type': 'application/json'
        });

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi(
          success: false,
          message: "No se pudo ejecutar la petición"
      );
    }

    print("RESPONSE LOGIN: ${response.body}");
    print("RESPONSE LOGIN: ${response.statusCode}");
    print("RESPONSE LOGIN: ${response.bodyString}");



    try {
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }

  }

   */

    Future<ResponseApi> login(String email, String password) async {

      Response response = await post('$url/login', {
        "email": email,
        "password": password
      }, headers: {
        'Content-Type': 'application/json'
      }); // Esperar hasta que el servidor retorne la respuesta


      print("RESPONSE LOGIN: ${response.body}");
      print("RESPONSE LOGIN: ${response.statusCode}");
      print("RESPONSE LOGIN: ${response.bodyString}");

      if (response.body == null) {
        Get.snackbar("Error", "No se pudo ejecutar la petición");
        return ResponseApi(success: false, message: "No se pudo ejecutar la petición");
      }

      try{
        ResponseApi responseApi = ResponseApi.fromJson(response.body);
        return responseApi;
      }catch(e){
        print("Error: $e");
        return ResponseApi(
            success: false,
            message: "Algo salió mal"
        );
      }
    }

  Future<ResponseApi> create(String email, String name, String password) async {
    Response response = await post('$url/create', {
      "email": email,
      "name": name,
      "password": password
    }, headers: {
      'Content-Type': 'application/json'
    }); // Esperar hasta que el servidor retorne la respuesta

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi(success: false, message: "No se pudo ejecutar la petición");
    }

    try {
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }
  }


  Future<ResponseApi> sendCodeNumberPhone(String id, String phoneNumber) async {
    Response response = await post('$url/sendCodeNumberPhone', {
      "id": id,
      "phone": phoneNumber
    }, headers: {
      'Content-Type': 'application/json',
      'Authorization': "Token ${userSession.authToken ?? ''}"
    });

    print("RESPONSE USER sendCodeNumberPhone: ${response.body}");

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar("Error", "No estas autorizado para realizar esta acción");
      return ResponseApi();
    }


    try{
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }
  }


  Future<ResponseApi> numberPhoneVerify(String id, String code) async {
    Response response = await put('$url/numberPhoneVerify', {
      "id": id,
      "code": code
    }, headers: {
      'Content-Type': 'application/json',
      'Authorization': "Token ${userSession.authToken ?? ''}"
    });

    print("RESPONSE USER numberPhoneVerify: ${response.body}");

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar("Error", "No estas autorizado para realizar esta acción");
      return ResponseApi();
    }

    try{
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }
  }

  Future<ResponseApi> deleteAccount(String id) async {
    Response response = await post('$url/deleteAccount',{
      "id": id
    },
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Token ${userSession.authToken ?? ''}"
        });

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar("Error", "No estas autorizado para realizar esta acción");
      return ResponseApi();
    }

    try{
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }
  }



  Future<ResponseApi> updateNotificationToken(String id, String token) async {
    if(userSession.id == ''){
      return ResponseApi(
          success: false,
          message: "No se pudo actualizar el token"
      );
    }
    
    Response response = await put('$url/updateNotificationToken', {
      "id": id,
      "token": token
    }, headers: {
      'Content-Type': 'application/json',
      'Authorization': "Token ${userSession.authToken ?? ''}"
    }); // Esperar hasta que el servidor retorne la respuesta


    if (response.body == null) {
      Get.snackbar("Error", "No se pudo actualizar la información");
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar("Error", "No estas autorizado para realizar esta acción");
      return ResponseApi();
    }

    try{
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }
  }


  Future<ResponseApi> sendCodePasswordRecovery(String email) async {
    Response response = await post('$url/sendCodePasswordRecovery', {
      "email": email
    }, headers: {
      'Content-Type': 'application/json'
    });

    print("RESPONSE USER sendCodePasswordRecovery: ${response.body}");

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar("Error", "No estas autorizado para realizar esta acción");
      return ResponseApi();
    }

    try{
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }
  }


  Future<ResponseApi> verifyCodePassword(int code, String email) async{
    Response response = await post('$url/verifyCodePassword', {
      "code": code,
      "email": email
    }, headers: {
      'Content-Type': 'application/json'
    });

    print("RESPONSE USER verifyCodePassword: ${response.body}");

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar("Error", "No estas autorizado para realizar esta acción");
      return ResponseApi();
    }

    try{
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }
  }


  Future<ResponseApi> updatePassword(String password, String token) async {
    Response response = await put('$url/updatePassword', {
      "token": token,
      "password": password
    }, headers: {
      'Content-Type': 'application/json'
    });

    print("RESPONSE  updatePassword: ${response.body}");

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar("Error", "No estas autorizado para realizar esta acción");
      return ResponseApi();
    }

    try{
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }

  }

  Future<ResponseApi> loginWithGoogle(GoogleAuthData account) async {

    Response response = await post('$url/loginWithGoogle',
        account.toJson(),
        headers: {
          'Content-Type': 'application/json'
        });

    if (response.body == null) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi(
          success: false,
          message: "No se pudo ejecutar la petición"
      );
    }

    try {
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      return responseApi;
    } catch (e) {
      print('ERROR LOGIN $e');
      return ResponseApi(
          success: false,
          message: "Algo falló"
      );
    }

  }









}