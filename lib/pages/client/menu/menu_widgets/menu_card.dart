

import 'dart:typed_data';

import 'package:cafeteria_revolucion/models/menu_type.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {

  TypeFood typeFood;
  MenuCard(this.typeFood);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 140.0,
        height: 220.0,
        color: Colors.white,
        child:  Column(
            children: [
              _imageObject(),
              _nameObject()
            ])
    );
  }

  Widget _imageObject(){
    return Container(
      width: 120.0,
      height: 120.0,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff3d0505),
      ),
      child:Image(
          image: typeFood.imageUrl != null
            ? NetworkImage(typeFood.imageUrl??"")
            : AssetImage('assets/img/coffebeans.png') as ImageProvider

    )
    );
  }


  Widget _nameObject(){
    return Container(
      //center text
      alignment: Alignment.center,
      child: Text(
        typeFood.name ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}


