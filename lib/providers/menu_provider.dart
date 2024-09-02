import 'package:cafeteria_revolucion/environment/environment.dart';
import 'package:cafeteria_revolucion/models/menu_type.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user.dart';

class MenuProvider  extends GetConnect{

  String url = Environment.API_URL + "menu";

  User userSession = User.fromJson(GetStorage().read('user') ?? {});


  Future<Response> getMenu() async {

    Response response = await get('$url/getAll',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${userSession.authToken ?? ''}"
    });

    if(response.status == 401) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return Response();
    }

    print("RESPONSE MENU getAll: ${response.body}");

    List<MenuType> menu = MenuType.fromJsonList(response.body);

    print("MENU: ${menu.length}");

    return response;
   }



}