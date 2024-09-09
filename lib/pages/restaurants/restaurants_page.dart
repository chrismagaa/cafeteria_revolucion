import 'package:cafeteria_revolucion/pages/restaurants/restaurants_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantsPage extends StatelessWidget {

  RestaurantsController con = Get.put(RestaurantsController());

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>
          Scaffold(
          appBar: AppBar(
            title: Text('Selecciona un restaurante'),
          ),
          body:

          con.isLoading.value == true ? _showShimmerList(): listRestaurants()
         )
      );
  }


  Widget _showShimmerList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.symmetric( vertical: 2),
                width: double.infinity,
                height: 90,
                color: Colors.white,
              );
            },
          )),
    );
  }

  Widget listRestaurants() {
    return ListView.builder(
      itemCount: con.restaurants.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(con.restaurants[index].name??"", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(con.restaurants[index].address??""),
              Text(con.restaurants[index].horary??""),
              Padding(padding: EdgeInsets.only(top: 5)),
              Divider(height: 10,color: Colors.grey[300])
            ],
          ),
          onTap: () {
           // Get.toNamed('/restaurant/menu', arguments: con.restaurants[index]);
            con.saveRestaurant(con.restaurants[index]);
          },
        );
      },
    );
  }
}
