import 'package:cafeteria_revolucion/models/menu_type.dart';
import 'package:cafeteria_revolucion/models/response_api.dart';
import 'package:cafeteria_revolucion/models/sucursal.dart';
import 'package:cafeteria_revolucion/providers/menu_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'config/type_order_provider.dart';

class ClientOrdenaController extends GetxController {

  var restaurantSelected = Sucursal().obs;
  var typeOrderSelected = TypeOrderModel().obs;



  MenuProvider menuProvider = MenuProvider();


  RxList<MenuType> listMenu = <MenuType>[].obs;

  RxList<TypeFood>  listMenuBebidas = <TypeFood>[].obs;
  RxList<TypeFood>  listMenuAlimentos = <TypeFood>[].obs;
  RxList<TypeFood>  listMenuCafeEnGrano = <TypeFood>[].obs;


  var fecha = '';



  @override
  void onInit() {
    super.onInit();
    restaurantSelected.value = Sucursal.fromJson(GetStorage().read('restaurant'));
    getFromStorageTypeOrderSelected();
    getDateFormated();
    getMenu();
  }

  void getDateFormated() {
    var now = DateTime.now();
    DateFormat dateFormat = DateFormat('d \'de\' MMMM');
    var formattedDate = dateFormat.format(now);
    fecha = 'Hoy, $formattedDate';
  }

  void goToSelectRestaurant() async {
   await Get.toNamed('/restaurants')?.then((value) {
     restaurantSelected.value = Sucursal.fromJson(GetStorage().read('restaurant'));
   });
  }

  void goToConfigOrder() {
    Get.toNamed('/client/ordena/config')?.then((value) {
      getFromStorageTypeOrderSelected();
    });
  }

  void getFromStorageTypeOrderSelected() {
    var typerOrder = GetStorage().read('typeOrder');

    if(typerOrder == null || typerOrder == '') {
      this.typeOrderSelected.value = TypeOrderProvider().typeOrderList.first;
      return;
    }


    var typeOrderSelected = TypeOrderProvider().typeOrderList.firstWhere((element) => element.typeOrder.toString() == typerOrder);
    this.typeOrderSelected.value = typeOrderSelected;
  }

  void getMenu() async {
    ResponseApi response = await menuProvider.getMenu();

    if(response.success == true) {

      listMenu.assignAll(MenuType.fromJsonList(response.data));

      listMenuBebidas.assignAll(listMenu.firstWhere((element) => element.title?.toLowerCase() == 'bebidas').types!);
      listMenuAlimentos.assignAll(listMenu.firstWhere((element) => element.title?.toLowerCase() == 'alimentos').types!);
      listMenuCafeEnGrano.assignAll(listMenu.firstWhere((element) => element.title?.toLowerCase() == 'cafe en grano').types!);

      print("LIST ALIMENTOS: ${listMenuAlimentos.length}");

    }else{
      Get.snackbar("Error", response.message??"");
    }



  }



}