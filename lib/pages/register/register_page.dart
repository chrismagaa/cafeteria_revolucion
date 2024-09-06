import 'dart:io';

import 'package:cafeteria_revolucion/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {

  RegisterController con = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
        ),
        bottomNavigationBar: Container(height: 60, child:  _textHaveAccount()),
        body: _contentRegister(context)
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        alignment: Alignment.center,
        child:
        //hacer que la imagen sea transparente
        Opacity(
          child:
          Image(
            image: AssetImage('assets/img/fondo.png'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          opacity: 0.1,
        )
    );
  }

  Widget _contentRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFiledEmail(),
            _textFiledName(),
            // _textFiledLastName(),
            // _textFiledPhone(),
            _textFiledPassword(),
            _textFiledConfirmPassword(),
            _buttonRegister(context),
            _or(),
            _signWithGoogle(),
          ],
        ),
      ),
    );
  }

  Widget _or(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Expanded(child: Divider(color: Colors.black)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("O continua con", style: TextStyle(fontSize: 17)),
          ),
          Expanded(child: Divider(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _signWithGoogle(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
      child: ElevatedButton.icon(
        onPressed: () => {
          con.continueWithGoogle()
        },
        icon: Image.asset('assets/img/google.png', height: 30, width: 30),
        label: Text("Google", style: TextStyle(fontSize: 17, color: Colors.black)),
        style: ElevatedButton.styleFrom(
          elevation: 10,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),),
      ),
    );

  }


  Widget _textYaTengoUnaCuenta(){
    return Container(
      margin: EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [TextButton(
            onPressed: () => con.goToLoginPage(),
            child: Text('Ya tengo una cuenta',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)))
        ],
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return
      Obx(() =>
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
            child: ElevatedButton(
              onPressed: () => con.register(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 15)),
              child:
              con.isLoading.value
                  ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ) :
              Text(
                "Registrarse",
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ));
  }

  Widget _textFiledEmail() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          labelText: 'Correo electrónico',
          suffixIcon: Icon(Icons.email, color: Colors.grey[700]),
        ),
      ),
    );
  }

  Widget _textFiledName() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Nombre',
          labelText: 'Nombre',
          suffixIcon: Icon(Icons.person, color: Colors.grey[700]),
        ),
      ),
    );
  }



  Widget _textFiledPassword() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock, color: Colors.grey[700]),
        ),
      ),
    );
  }

  Widget _textFiledConfirmPassword() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
      child: TextField(
        controller: con.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Confirmar contraseña',
          labelText: 'Confirmar contraseña',
          suffixIcon: Icon(Icons.lock, color: Colors.grey[700]),
        ),
      ),
    );
  }



  Widget _buttonBack(){
    return SafeArea(child:
    Container(
      margin: EdgeInsets.only(left: 20, top: 5),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, size: 30),
        onPressed: () => Get.back(),
      ),
    )
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Crea una cuenta',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold)),
          Text('Bienvenido, ingresa tus datos para continuar',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              )),
        ],
      ),
    );
  }


  Widget _textHaveAccount() {
    return Row(
      //Ubicar elementos uno al lado del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            "¿Ya tienes una cuenta?",
            style: TextStyle(fontSize: 17,
            )
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: () => con.goToLoginPage(),
          child: Text(
            "Inicia sesión",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }






}