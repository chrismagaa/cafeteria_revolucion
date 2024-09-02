import 'package:cafeteria_revolucion/models/promo.dart';
import 'package:cafeteria_revolucion/pages/client/promos/promos_widgets/promo_item.dart';
import 'package:flutter/material.dart';

class ClientPromosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return SafeArea(child:
    ListView(
      children: [
        _title(),
       _promosList(),
      ],
    )
    );
  }
  
  Widget _promosList(){
    return Container(
      child: Column(
        children: <Widget>[
          PromoItem(Promo(title: 'Mananas deli con cafe y un mini crossaint por \$39', body: 'Enero 08, 2024', url: 'https://www.google.com', imagenUrl: 'https://djftrby1k8irl.cloudfront.net/s3fs-public/2024-01%2FMANANAS-DELI.jpg?auto=format,compress&q=70&crop=focalpoint&ar=1.85:1.0&w=530&fit=max')),
          PromoItem(Promo(title: 'Empieza tu dia con tu cafe mas crosaint fruta por \$99', body: 'Enero 08, 2024', url: 'https://www.google.com', imagenUrl: 'https://djftrby1k8irl.cloudfront.net/s3fs-public/2024-01%2Fbuenos-dias-en-starbucks.jpg?auto=format,compress&q=70&crop=focalpoint&ar=1.85:1.0&w=530&fit=max')),
        ],
      ),
    );
  }
  
    Widget _title(){
      return Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
        ),
        child: Text(
          'Promociones',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),
        ),
      );
    }


}
