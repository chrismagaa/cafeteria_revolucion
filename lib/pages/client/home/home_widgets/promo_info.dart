import 'package:cafeteria_revolucion/models/promo.dart';
import 'package:flutter/material.dart';

class PromoInfo extends StatelessWidget {

  Promo promo;

  PromoInfo(this.promo);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    final place = Text(
      this.promo.title??"",
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 18.0,
          fontWeight: FontWeight.bold
      ),
    );

    final placeInfo = Padding(
        padding: EdgeInsets.symmetric(
            vertical: 5.0
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.promo.body??"",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                ),
              )
            ]
        )
    );



    final card = Container(
      width: screenWidth * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              place,
              placeInfo,
            ],
          )
      ),
    );

    return Stack(
      alignment: Alignment(0.8, 1.25),
      children: <Widget>[
        card,
     //   FloatingActionButtonGreen()
      ],
    );
  }

}