import 'package:cafeteria_revolucion/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../environment/environment.dart';
import '../models/response_api.dart';

class UsersProvider extends GetConnect {

  String url = Environment.API_URL + "users";

  User userSession = User.fromJson(GetStorage().read('user') ?? {});

    Future<ResponseApi> login(String email, String password) async {

      Response response = await post('$url/login', {
        "email": email,
        "password": password
      }, headers: {
        'Content-Type': 'application/json'
      }); // Esperar hasta que el servidor retorne la respuesta


      if (response.body == null) {
        Get.snackbar("Error", "No se pudo ejecutar la petición");
        return ResponseApi();
      }

      print("RESPONSE USER LOGIN: ${response.body}");

      ResponseApi responseApi = ResponseApi.fromJson(response.body);

      return responseApi;
    }

  Future<ResponseApi> create(User user) async {
    Response response = await post('$url/create', user.toJson(), headers: {
      'Content-Type': 'application/json'
    }); // Esperar hasta que el servidor retorne la respuesta

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    print("RESPONSE USER CREATE: ${responseApi.toJson()}");

    return responseApi;
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



    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    print("RESPONSE USER sendCodeNumberPhone: ${responseApi.toJson()}");

    return responseApi;
  }


  Future<ResponseApi> numberPhoneVerify(String id, String code) async {
    Response response = await put('$url/numberPhoneVerify', {
      "id": id,
      "code": code
    }, headers: {
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

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    print("RESPONSE USER UPDATE: ${responseApi.toJson()}");

    return responseApi;
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

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    print("RESPONSE USER deleteAccount: ${responseApi.toJson()}");

    return responseApi;
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

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    print("RESPONSE USER updateNotificationToken: ${responseApi.toJson()}");

    return responseApi;
  }





}