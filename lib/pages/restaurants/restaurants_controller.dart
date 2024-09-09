import 'package:cafeteria_revolucion/models/sucursal.dart';
import 'package:cafeteria_revolucion/providers/sucursales_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class  RestaurantsController extends GetxController {

  RxBool isLoading = true.obs;
  RxList<Sucursal> restaurants = <Sucursal>[].obs;

  SucursalesProvider sucursalesProvider = SucursalesProvider();

  RestaurantsController(){
    print("RestaurantsController");
    getRestaurants();
  }


  void getRestaurants() async {

    isLoading(true);
    var response = await sucursalesProvider.getSucursales();
    isLoading(false);

    if(response.success == true){
      restaurants.value = Sucursal.fromJsonList(response.data);
    }else{
      Get.snackbar('Error', response.message??"");
    }

  }

  void saveRestaurant(Sucursal restaurant) {
    //save restauran selected in GetStorage
    GetStorage().write('restaurant', restaurant.toJson());
    //regresar
    Get.back();
  }





}