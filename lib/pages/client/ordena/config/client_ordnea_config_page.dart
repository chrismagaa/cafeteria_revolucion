import 'package:cafeteria_revolucion/pages/client/ordena/config/client_ordena_config_controller.dart';
import 'package:cafeteria_revolucion/pages/client/ordena/config/type_order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/menu_type.dart';
import '../../../../widgets/menu_widgets/menu_card.dart';

class ClientOrdneaConfigPage extends StatelessWidget {


  ClientOrdenaConfigController con = Get.put(ClientOrdenaConfigController());

  @override
  Widget build(BuildContext context) {
    return

      GetBuilder<ClientOrdenaConfigController>(
        builder: (_) =>
      Scaffold(
      bottomSheet: buttonSave(),
      appBar: AppBar(
        title: Text('Configuración de pedidos'),
        centerTitle: true,
        //set x icon
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          tipoPedido(),

        ],
      ),
    )
      );
  }




  Widget tipoPedido() {
    return Container(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: con.tiposOrdenes.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  con.selectTypeOrder(con.tiposOrdenes[index]);
                },
                child: selectTipoPedido(con.tiposOrdenes[index]),
              );
            },
          )
        ],
      )
    );
  }


  Widget selectTipoPedido(TypeOrderModel typeOrder) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          //icon selected
          typeOrder.selected == true ?
          Icon(CupertinoIcons.check_mark_circled_solid, color: Color(0xff3d0505), size: 30) : Icon(Icons.radio_button_unchecked, color: Color(0xff3d0505), size: 30),
          Padding(padding: EdgeInsets.only(left: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(typeOrder.title??"", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(typeOrder.description??"", style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
            ],
          )
        ],
      ),
    );
  }



  Widget buttonSave() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff3d0505)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          )
        ),
        onPressed: () {
         // con.saveConfig();
          Get.back();
        },
        child: Text('Guardar', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }


}
