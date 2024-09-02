import 'package:flutter/material.dart';

import '../../../../models/promo.dart';

class PromoItem extends StatelessWidget {

  Promo promo;

  PromoItem(this.promo);



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


    return Container(

      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0
      ),
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 5)
          )
        ]
      ),
      child: Row(
        children: <Widget>[
         _imagePromo(),
          _infoPromo()
        ],
      ),
    );
  }

  Widget _infoPromo(){
    return
      Container(
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      width: 190.0,
      height: 140.0,
      child: Column(
        //space between
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(promo.title??'', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
           Container(
              width: 190.0,
               child: Text(promo.body??'',textAlign: TextAlign.right, style: TextStyle(fontSize: 16.0,),)),
        ],
      ),
      );
  }



 Widget _imagePromo(){
    return Container(
      width: 160.0,
      height: 160.0,
      child:

      ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        child: Image(
          image: promo.imagenUrl != null
              ? NetworkImage(promo.imagenUrl??'')
              : AssetImage('assets/img/no-image.png') as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
