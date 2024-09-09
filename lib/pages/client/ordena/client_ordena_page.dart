import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu_type.dart';
import '../../../widgets/menu_widgets/menu_card.dart';
import 'client_ordena_controller.dart';

class ClientOrdenaPage extends StatelessWidget {

  ClientOrdenaController con = Get.put(ClientOrdenaController());

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>
      Scaffold(
      appBar: AppBar(
        title: Text('Ordena'),
      ),
      body:

         SingleChildScrollView(

           child: Column(
            children: [
               sucursalSeleccionada(),
              configuracionPedido(),
              _tabController(),
            ],
                   ),
         ),
      )
      );
  }

  Widget _tabController(){
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 100),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: 'Bebidas', icon: Icon(Icons.local_drink)),
                  Tab(text: 'Alimentos', icon: Icon(Icons.fastfood_outlined)),
                  Tab(text: 'Cafe en grano', icon: Icon(Icons.local_cafe)),
                ],
              ),
            ),


                    Container(
                      height: 500,
                    padding: EdgeInsets.only(top: 15),
                    child: TabBarView(
                        children: [
                          _menuListBebidas(),
                          _menuListAlimentos(),
                           _menuListCafeEnGrano(),
                        ],
                      ),
                   ),


          ],
        ),
      ),
    );
  }



  Widget _menuListBebidas(){
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        shrinkWrap: true,
        itemCount: con.listMenuBebidas.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return MenuCard(con.listMenuBebidas[index]);
        },
      )
    );
  }

  Widget _menuListAlimentos(){
    return Container(
      child: //create list with 2 columns
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: con.listMenuAlimentos.length,
        itemBuilder: (context, index) {
          return MenuCard(con.listMenuAlimentos[index]);
        },
      )
    );
  }

  Widget _menuListCafeEnGrano(){
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: con.listMenuCafeEnGrano.length,
        itemBuilder: (context, index) {
          return MenuCard(con.listMenuCafeEnGrano[index]);
        },
      )
    );
  }


  Widget configuracionPedido () {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                //redondear
                margin: EdgeInsets.only(left: 20, right: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff3d0505),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(con.typeOrderSelected.value.icon, size: 30, color: Colors.white),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(con.typeOrderSelected.value.title??"", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    Text(con.fecha??"", style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
                    Text('A las 2:00 pm', style: TextStyle(fontSize: 14), textAlign: TextAlign.center)
                  ],
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(right: 5),
            child: TextButton(
              onPressed: () {
                //con.goToSelectRestaurant();
                con.goToConfigOrder();
              },
              child: Text('Cambiar', style: TextStyle(color: Color(0xff3d0505), fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
          )
        ]//text button cambiar
      ),
    );
  }



  Widget sucursalSeleccionada() {
    return Container(
      height: 50,
      child: GestureDetector(
        onTap: () {
          con.goToSelectRestaurant();
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.grey[200],
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(con.restaurantSelected.value.name??"", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
      ),
    );
  }


}
