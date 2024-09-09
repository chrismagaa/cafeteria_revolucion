
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeOrder {
  restaurant,
  store
}

class TypeOrderModel {
  TypeOrder? typeOrder;
  String? title;
  String? description;
  bool? selected;
  IconData? icon;
  TypeOrderModel({this.typeOrder, this.title, this.description, this.selected = false, this.icon});
}


class TypeOrderProvider {
  List<TypeOrderModel> typeOrderList = [
    TypeOrderModel(
      typeOrder: TypeOrder.restaurant,
      title: 'Consumir en el restaurante',
      description: 'El pedido se sirve en el restaurante',
      icon: Icons.restaurant
    ),
    TypeOrderModel(
      typeOrder: TypeOrder.store,
      title: 'Recoger en tienda',
      description: 'El pedido se recoge en la tienda',
      icon: Icons.store
    )
  ];
}
