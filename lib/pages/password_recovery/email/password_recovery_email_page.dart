


import 'package:cafeteria_revolucion/pages/password_recovery/email/password_recovery_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordRecoveryEmailPage extends StatelessWidget {


  PasswordRecoveryEmailController con = Get.put(PasswordRecoveryEmailController());


  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
            appBar: AppBar(
              title: Text(''),
            ),
            bottomSheet: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => con.sendCode(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: Container(
                    padding: EdgeInsets.all(15),
                    child:
                    con.isLoading.value ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),) :
                    Text('Enviar código', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16),)),
              ),
            ),
            body: Column(
              children: [
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    child: Text("Recuperar contraseña", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),)
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text("Ingresa la dirección de correo electrónico de tu cuenta y te enviaremos un código para restablecer tu contraseña", style: TextStyle(fontSize: 16),)),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: con.emailController,
                    decoration: InputDecoration(
                      hintText: 'Correo electrónico',
                    ),
                  ),
                ),
              ],
            )
        ),
    );
  }


}