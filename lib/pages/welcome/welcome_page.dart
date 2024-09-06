import 'package:cafeteria_revolucion/pages/welcome/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {

  WelcomeController con = Get.put(WelcomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _bottomButtons(),
      body: Stack(
        children: [
          _backgroundCover(context),
        ],
      ),
    );
  }

  Widget _bottomButtons(){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.black
      ),
      height: 180,
      child: Column(
        children: [
          _buttonLogin(),
          _buttonRegister()
        ],
      ),
    );
  }

  Widget _buttonLogin(){
    return Container(

      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ElevatedButton(
        onPressed: (){
          con.goToLoginPage();
        },
        child: Text('Iniciar Sesión', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buttonRegister(){
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[400],
        ),
        onPressed: (){
          con.goToRegisterPage();
        },
        child: Text('Registrarse', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child:

            //agregar una capa negra transparente para que se vea mejor el texto
            Stack(
              children: [
                Image(image: AssetImage('assets/img/coffe_background.jpg'), fit: BoxFit.cover, height: double.infinity, width: double.infinity),

                Container(
                  color: Colors.black.withOpacity(0.6),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageLogo(),
                      SizedBox(height: 50),
                    ],
                  ),
                )
              ],
            )
    );
  }

  Widget imageLogo() {
    return Container(
      width:Get.width * 0.7,
      height: Get.width * 0.7,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/gran_cafe_revolucion_logo.png'),
          )
      ),
    );
  }


}
