import 'package:cafeteria_revolucion/environment/environment.dart';
import 'package:cafeteria_revolucion/models/menu_type.dart';
import 'package:cafeteria_revolucion/models/response_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user.dart';

class MenuProvider  extends GetConnect{

  String url = Environment.API_URL + "menu";

  User userSession = User.fromJson(GetStorage().read('user') ?? {});


  Future<ResponseApi> getMenu() async {

    Response response = await get('$url/getAll',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${userSession.authToken ?? ''}"
    });

    print("RESPONSE MENU getAll: ${response.body}");

    if(response.status == 401) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return ResponseApi(success: false, message: "No se pudo ejecutar la petición");
    }


    try {
      return ResponseApi.fromJson(response.body);
    } catch (e) {
      print("Error en getMenu: $e");
      return ResponseApi(success: false, message: "Error en getMenu");
    }

   }



}