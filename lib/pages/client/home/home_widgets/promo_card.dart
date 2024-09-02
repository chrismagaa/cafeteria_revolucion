import 'package:cafeteria_revolucion/pages/client/home/home_widgets/promo_info.dart';
import 'package:flutter/material.dart';
import '../../../../models/promo.dart';


class PromoCard extends StatelessWidget {
  Promo promo;

  PromoCard(this.promo);

  @override
  Widget build(BuildContext context) {

    final photoCard = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 70.0
      ),
      height: 220.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: promo.imagenUrl != null
                  ? NetworkImage(promo.imagenUrl??"")
                  : AssetImage('assets/img/coffebeans.png') as ImageProvider
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
    );

    return Stack(
    alignment: Alignment(0.0, 0.8),
    children: <Widget>[
      photoCard,
      PromoInfo(promo)
    ],
    );
  }
}
