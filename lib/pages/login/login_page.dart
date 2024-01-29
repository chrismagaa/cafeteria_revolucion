import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';


class LoginPage extends StatelessWidget {

  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(height: 60, child: _textDontHaveAccount()),
      body: Stack( // Stack para posicionar elementos encima de otros
        children: [
          _backgroundCover(context),
          _boxForm(context),
          Column( // POSICIONAR ELEMENTOS UNO DEBAJO DEL OTRO (VERTICAL)
            children: [
              _imageCover(),
              _textAppName()
            ],
          ),
        ],
      )
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.black,
    );
  }

  Widget _boxForm(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.32, left: 30, right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5)
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin()
          ],
        ),
      ),
    );
  }

  Widget _textYourInfo(){
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 45),
      child: Text(
        'INGRESA TUS DATOS',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          labelText: 'Correo electrónico',
          suffixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );
  }


  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: ElevatedButton(
        onPressed: () => con.login(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)

          ),
          padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.black
        ),
        child: Text(
          'Iniciar sesión',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }


  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        controller: con.passwordController,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock_outline),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );

  }



    Widget _textAppName(){
      return Text(
        'Cafeteria Revolucion',
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      );
    }

    // PRIVATE cuando hay un guion bajo antes del nombre
    Widget _imageCover(){
      return SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: 140,
          child: Image.asset('assets/img/coffee_bean.png'),
        ),
      );
    }

  Widget _textDontHaveAccount() {
    return Row(
      //Ubicar elementos uno al lado del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿No tienes cuenta?",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: () => con.goToRegisterPage(),
          child: Text(
            "Registrate aquí",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }





}
