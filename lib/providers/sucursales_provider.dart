



import 'package:get/get.dart';

class SucursalesProvider extends GetConnect{

    String url = "https://api-barber-app.herokuapp.com/sucursales";

    Future<Response> getSucursales() async {

      Response response = await get('$url/getAll',
        headers: {
          'Content-Type': 'application/json',
      });

      if(response.status == 401) {
        Get.snackbar("Error", "No se pudo ejecutar la petición");
        return Response();
      }

      print("RESPONSE SUCURSALES getAll: ${response.body}");

      return response;
    }
}