import 'package:cafeteria_revolucion/pages/client/menu/menu_widgets/menu_card.dart';
import 'package:flutter/material.dart';

import '../../../models/menu_type.dart';

class ClientMenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(child:
       ListView(
         children: [
           _title(),
           _searchMenu(),
           _tabController(),
         ],
       )
    );
  }

  Widget _tabController(){
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Bebidas', icon: Icon(Icons.local_drink)),
              Tab(text: 'Alimentos', icon: Icon(Icons.fastfood_outlined)),
              Tab(text: 'Cafe en grano', icon: Icon(Icons.local_cafe)),
            ],
          ),
          Container(
            height: 500,
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
    );
  }

  Widget _menuListBebidas(){
    return Container(
      child: Column(
        //hacer doble columna
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuCard(TypeFood(name: 'Bebidas calientes', imageUrl: 'https://djftrby1k8irl.cloudfront.net/s3fs-public/2022-03%2FFlat%20White%20425x425%20sin%20fondo.png?auto=format,compress&q=70&crop=focalpoint&ar=1:1.0&w=180&fit=crop', data: null)),
              MenuCard(TypeFood(name: 'Frapuccino', imageUrl: 'https://djftrby1k8irl.cloudfront.net/s3fs-public/2022-03%2FMocha%20Frapp%20425x425%20sin%20fondo.png?auto=format,compress&q=70&crop=focalpoint&ar=1:1.0&w=180&fit=crop', data: null)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuCard(TypeFood(name: 'Bebidas Frias', imageUrl: 'https://djftrby1k8irl.cloudfront.net/s3fs-public/2022-03%2FIced%20Caramel%20Macchiato%20425x425%20sin%20fondo.png?auto=format,compress&q=70&crop=focalpoint&ar=1:1.0&w=180&fit=crop', data: null)),
              MenuCard(TypeFood(name: 'Cold Brew', imageUrl: 'https://djftrby1k8irl.cloudfront.net/s3fs-public/2022-03%2FCold%20Brew%20Vainilla%20Sweet%20Cream%20425x425%20sin%20fondo.png?auto=format,compress&q=70&crop=focalpoint&ar=1:1.0&w=180&fit=crop', data: null)),
            ],
          )
        ],
      ),
    );
  }

  Widget _menuListAlimentos(){
    return Container(
      child: Column(
        //hacer doble columna
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuCard(TypeFood(name: 'Elige tu complemento', imageUrl: 'https://djftrby1k8irl.cloudfront.net/s3fs-public/2022-02%2FSandwich%20Pavo%20Panela_1.png?auto=format,compress&q=70&crop=focalpoint&ar=1:1.0&w=180&fit=crop', data: null)),
            ],
          ),

        ],
      ),
    );
  }

  Widget _menuListCafeEnGrano(){
    return Container(
      child: Column(
        //hacer doble columna
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuCard(TypeFood(name: 'Elige tu cafe favorito', imageUrl: 'https://djftrby1k8irl.cloudfront.net/s3fs-public/2022-02%2FChiapas_1.png?auto=format,compress&q=70&crop=focalpoint&ar=1:1.0&w=180&fit=crop', data: null)),
            ],
          ),

        ],
      ),
    );
  }

  Widget _searchMenu() {
    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0
            ),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  hintText: 'Buscar',
                 suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: Column(
        children: <Widget>[
          Text('Conoce nuestras bebidas y alimentos', style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
