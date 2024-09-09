import 'package:cafeteria_revolucion/pages/client/ordena/config/type_order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ClientOrdenaConfigController extends GetxController {


  RxList<TypeOrderModel> tiposOrdenes = TypeOrderProvider().typeOrderList.obs;



  @override
  void onInit() {
    super.onInit();
    getFromStorageTypeOrderSelected();
  }


  void selectTypeOrder(TypeOrderModel typeOrder) {
    tiposOrdenes.forEach((element) {
      element.selected = false;
    });
    typeOrder.selected = true;
    saveTypeOrderSelected();
    update();
  }


  void getFromStorageTypeOrderSelected() {
    var typerOrder = GetStorage().read('typeOrder');


    print('typerOrder: $typerOrder');

    if(typerOrder == null || typerOrder == '') {
      selectTypeOrder(tiposOrdenes.first);
      return;
    }

    TypeOrderModel typeOrder = tiposOrdenes.firstWhere((element) => element.typeOrder.toString() == typerOrder);
    selectTypeOrder(typeOrder);
  }


  void saveTypeOrderSelected() {
    TypeOrderModel typeOrder = tiposOrdenes.firstWhere((element) => element.selected == true);
    TypeOrder typeOrderEnum = typeOrder.typeOrder!;
    //save in getStorage typeOrderEnum
    GetStorage().write('typeOrder', typeOrderEnum.toString());
  }





}