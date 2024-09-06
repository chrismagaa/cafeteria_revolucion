import 'package:cafeteria_revolucion/pages/password_recovery/update/password_recovery_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordRecoveryUpdatePage extends StatelessWidget {

  PasswordRecoveryUpdateController con = Get.put(PasswordRecoveryUpdateController());

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
                onPressed: (){
                  con.changePassword();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: con.isLoading.value ? CircularProgressIndicator(color: Colors.white) : Text('Cambiar contraseña', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16),)),
              ),
            ),
            body: Column(
              children: [
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    child: Text("Nueva contraseña", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),)
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text("Esta contraseña tiene que ser diferente a la anterior.", style: TextStyle(fontSize: 16),)),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: con.passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: !con.showPassword.value,

                    decoration: InputDecoration(
                        hintText: 'Nueva contraseña',
                        labelText: 'Nueva contraseña',
                        suffixIcon: IconButton(
                            icon: Icon(con.showPassword.value ? Icons.visibility : Icons.visibility_off, color: Colors.grey[600]),
                            onPressed: () => con.showPassword.value = !con.showPassword.value)
                    ),

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: con.confirmPasswordController,
                    keyboardType: TextInputType.text,
                    obscureText: !con.showPassword.value,
                    decoration: InputDecoration(
                        hintText: 'Confirmar contraseña',
                        labelText: 'Confirmar contraseña',
                        suffixIcon: IconButton(
                          icon: Icon(con.showConfirmPassword.value ? Icons.visibility : Icons.visibility_off, color: Colors.grey[600]),
                          onPressed: () => con.showConfirmPassword.value = !con.showConfirmPassword.value,)

                    ),
                  ),
                ),
              ],
            )
        ),
    );
  }
}
