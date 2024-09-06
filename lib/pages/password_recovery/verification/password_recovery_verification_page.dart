


import 'package:cafeteria_revolucion/pages/password_recovery/verification/password_recovery_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasswordRecoveryVerificationPage extends StatelessWidget {

  PasswordRecoveryVerificationController con = Get.put(PasswordRecoveryVerificationController());


  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>
          Scaffold(
              bottomSheet: Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    con.verifyCode(con.code.value);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: con.isLoading.value ? CircularProgressIndicator(
                          color: Colors.white
                      ) : Text('Verificar', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16),)),
                ),
              ),
              appBar: AppBar(
                  title: Text('')
              ),
              body: Container(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(20),
                        child: Text("Por favor revisa tu correo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),)
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Text("Hemos enviado un código de verificación a tu correo electrónico, por favor ingrésalo a continuación", style: TextStyle(fontSize: 16),)
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        onChanged: (value) {
                          con.code.value = value;
                        },
                        onCompleted: (value) {
                          //  con.verifyPhoneNumber(value);
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeFillColor: Colors.red,
                          inactiveFillColor: Colors.grey[700],
                          selectedFillColor: Colors.black,
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey[400],
                          selectedColor: Colors.black,
                        ),
                      ),
                    ),

                    _resendCode()

                  ],
                ),
              )
          ));
  }

  Widget _resendCode() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child:
        con.timeResendCode.value > 0 ?
        Text("Reenviar código en ${con.timeResendCode.value} segundos", style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),):
        TextButton(
          onPressed: () {
            con.resendCode();
          },
          child: Text("Reenviar código", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        )
    );
  }


}
