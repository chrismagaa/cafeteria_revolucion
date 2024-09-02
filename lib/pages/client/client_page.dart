import 'package:cafeteria_revolucion/pages/client/home/client_home_page.dart';
import 'package:cafeteria_revolucion/pages/client/menu/client_menu_page.dart';
import 'package:cafeteria_revolucion/pages/client/ordena/client_ordena_page.dart';
import 'package:cafeteria_revolucion/pages/client/promos/client_promos_page.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: <Widget>[
        ClientHomePage(),
        ClientMenuPage(),
        ClientPromosPage(),
        ClientOrdenaPage()
      ][currentPageIndex],
    );
  }

  Widget _bottomNavigationBar(){
    return NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor:  Color(0xff3d0505),
        selectedIndex: currentPageIndex,
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
        ],


    );
  }

}
