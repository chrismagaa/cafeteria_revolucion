import 'package:flutter/material.dart';

class ClientOrdenaPage extends StatelessWidget {
  const ClientOrdenaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Container(
          child: Text("ORDENA",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          alignment: Alignment.center,
        )
    );
  }
}
