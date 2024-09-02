import 'package:cafeteria_revolucion/models/promo.dart';
import 'package:flutter/material.dart';

import 'home_widgets/promo_card.dart';

class ClientHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        _backgroundHome(screenHeight, screenWidth),
        ListView(
          children: <Widget>[
            _title(),
            _promoList()
          ],
        )
      ],
    );
  }



  Widget _promoList() {
    return Container(
      margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
      ),
      child: Column(
        children: <Widget>[
          PromoCard(Promo(
              title: "NUEVO CINNAMON CHOCOLATE",
              body: "Empieza el año con un nuevo sabor, disfruta de nuestro nuevo Cinnamon Chocolate.",
              url: "https://www.caferevolucion.com/promo1",
              imagenUrl: "https://djftrby1k8irl.cloudfront.net/s3fs-public/2024-01%2FCinnamon%20Chocolate-min.png?auto=format,compress&q=70&crop=focalpoint&ar=1.8:1.0&w=1400&fit=max"
          )),
          PromoCard(Promo(
              title: "SABOR CAJETA",
              body: "Este invierno es la excusa perfecta para compartir un Cajeta Latte o Frappuccino con amigos y familia.",
              url: "https://www.caferevolucion.com/promo1",
              imagenUrl: "https://djftrby1k8irl.cloudfront.net/s3fs-public/2024-01%2FCajeta-min.png?auto=format,compress&q=70&crop=focalpoint&ar=1.8:1.0&w=1400&fit=max"
          )),
          PromoCard(Promo(
              title: "TU VASO HACE LA DIFERENCIA",
              body: "Trae tu vaso o termo favorito y obten 5 de descuento en tu bebida",
              url: "https://www.caferevolucion.com/promo1",
              imagenUrl: "https://djftrby1k8irl.cloudfront.net/s3fs-public/2024-01%2FSitio_web_winter_2024_Merch.png?auto=format,compress&q=70&crop=focalpoint&ar=1.8:1.0&w=1400&fit=max"
          ))
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0
      ),
      child: Text(
        "Bienvenido a Café Revolución!",
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
    );
  }


  Widget _backgroundHome(screenHeight, screenWidth) {
    return Container(
      width: screenWidth,
      height: screenHeight  * 0.45,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF620505),
                Color(0xFF481616)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
          )
      ),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              borderRadius: BorderRadius.circular(screenHeight / 2)
          ),
        ),
      ),
    );
  }
}
