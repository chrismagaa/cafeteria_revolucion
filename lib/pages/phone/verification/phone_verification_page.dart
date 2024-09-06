import 'package:cafeteria_revolucion/pages/phone/verification/phone_verification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerificationPage extends StatelessWidget {
  PhoneVerificationController con = Get.put(PhoneVerificationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(),
      bottomSheet: _bottomButtonVerificar(),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verificación',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Ingresa el código de verificación enviado al número ${con.phoneNumber}',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,

              ),
            ),
            SizedBox(height: 30),
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                con.verificationCode.value = value;
              },
              onCompleted: (value) {
                con.verifyPhoneNumber(value);
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.red,
                inactiveFillColor: Colors.black,
                selectedFillColor: Colors.black,
                activeColor: Colors.black,
                inactiveColor: Colors.black,
                selectedColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget _bottomButtonVerificar(){
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            backgroundColor: Colors.black,
          ),
          onPressed: con.verificationCode.value.length == 6
              ? () => con.verifyPhoneNumber(con.verificationCode.value)
              : null,
          child:
          con.isLoading.value
              ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
          )
              : Text('Verificar',
              style: TextStyle(fontSize: 16, color: Colors.white))
      ),
    );
  }



}
