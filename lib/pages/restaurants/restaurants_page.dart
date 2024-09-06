import 'package:flutter/material.dart';

class RestaurantsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona un restaurante'),
      ),
      body: listRestaurants(),
    );
  }

  Widget listRestaurants() {


  }
}
