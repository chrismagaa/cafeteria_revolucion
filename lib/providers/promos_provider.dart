import 'package:cafeteria_revolucion/environment/environment.dart';
import 'package:cafeteria_revolucion/models/promo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user.dart';

class PromosProvider extends GetConnect{
  String url = Environment.API_URL + "promos";

  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  Future<List<Promo>> getPromos() async {
    Response response = await get('$url/getAll',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${userSession.authToken ?? ''}"
      }
    );

    if(response.status == 401) {
      Get.snackbar("Error", "No se pudo ejecutar la petición");
      return <Promo>[];
    }

    print("RESPONSE PROMOS getAll: ${response.body}");

    List<Promo> promos = Promo.fromJsonList(response.body);

    print("PROMOS: ${promos.length}");

    return promos;
  }
}