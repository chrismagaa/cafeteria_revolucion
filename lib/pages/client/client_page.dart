import 'package:cafeteria_revolucion/pages/client/client_controller.dart';
import 'package:cafeteria_revolucion/pages/client/home/client_home_page.dart';
import 'package:cafeteria_revolucion/pages/client/menu/client_menu_page.dart';
import 'package:cafeteria_revolucion/pages/client/ordena/client_ordena_page.dart';
import 'package:cafeteria_revolucion/pages/client/promos/client_promos_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientPage extends StatelessWidget {

  ClientController con = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return
      Obx( () =>
      Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: <Widget>[
        ClientHomePage(),
        ClientMenuPage(),
        ClientPromosPage(),
        ClientOrdenaPage()
      ][con.currentPageIndex.value],
    ));
  }

  Widget _bottomNavigationBar(){
    return NavigationBar(
        onDestinationSelected: (int index) {
          con.currentPageIndex.value = index;
        },
        indicatorColor:  Color(0xff3d0505),
        selectedIndex: con.currentPageIndex.value,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            selectedIcon: Icon(Icons.book_sharp, color: Colors.white),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.percent_sharp),
            selectedIcon: Icon(Icons.percent_sharp, color: Colors.white),
            label: 'Promociones',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag),
            selectedIcon: Icon(Icons.shopping_bag_sharp, color: Colors.white),
            label: 'Ordena',
          ),
        ]
    );
  }

}
