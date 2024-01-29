import 'dart:io';

import 'package:cafeteria_revolucion/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {

  RegisterController con = Get.put(RegisterController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _backgroundCover(context),
            _boxForm(context),
            _imageUser(context),
            _buttonBack(),
          ],
        ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.black,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.25, left: 50, right: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 15, offset: Offset(0, 5))
          ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFiledEmail(),
            _textFiledName(),
            _textFiledLastName(),
        //    _textFiledPhone(),
            _textFiledPassword(),
            _textFiledConfirmPassword(),
            _buttonRegister(context),
          ],
        ),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 30),
      child: Text('INGRESA TUS DATOS',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  Widget _textFiledEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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

  Widget _textFiledName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Nombre',
          labelText: 'Nombre',
          suffixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            )

        ),
      ),
    );
  }

  Widget _textFiledLastName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: con.lastNameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Apellido',
          labelText: 'Apellido',
          suffixIcon: Icon(Icons.person_outline),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
      ),
    );
  }


  Widget _textFiledPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
       controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
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


  Widget _textFiledConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: con.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Confirmar contraseña',
          labelText: 'Confirmar contraseña',
          suffixIcon: Icon(Icons.lock_outline),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
      ),
    );
  }


  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: ElevatedButton(
        onPressed: () => (),
     //   onPressed: () => con.register(context),
        style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 15)),

        child: Text(
          "Registrarse",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          //  onTap: () => con.showAlerDialog(context),
            child: GetBuilder<RegisterController>(
              builder: (valuer) =>
                  CircleAvatar(
                      backgroundImage: con.imageFile != null
                          ? FileImage(con.imageFile! as File)
                          :
                      AssetImage('assets/img/photo.png') as ImageProvider,
                      radius: 60,
                      backgroundColor: Colors.white
                  ),
            )
        ),
      ),
    );
  }

  Widget _buttonBack(){
    return SafeArea(child:
    Container(
      margin: EdgeInsets.only(left: 20, top: 5),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
        onPressed: () => Get.back(),
      ),
    )
    );
  }





}
