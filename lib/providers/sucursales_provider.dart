import 'package:cafeteria_revolucion/environment/environment.dart';
import 'package:cafeteria_revolucion/models/response_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user.dart';

class SucursalesProvider extends GetConnect{

    String url = Environment.API_URL + "sucursales";
    User userSession = User.fromJson(GetStorage().read('user') ?? {});

    Future<ResponseApi> getSucursales() async {

      Response response = await get('$url/getAll',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Token ${userSession.authToken ?? ''}"
      });

      if(response.status == 401) {
        Get.snackbar("Error", "No se pudo ejecutar la petición");
        return ResponseApi();
      }

      print("RESPONSE SUCURSALES getAll: ${response.body}");


      try {
        ResponseApi responseApi = ResponseApi.fromJson(response.body);
        return responseApi;
      } catch (e) {
        print("ERROR: $e");
        return ResponseApi(
          success: false,
          message: "Error al obtener las sucursales"
        );
      }

    }
}