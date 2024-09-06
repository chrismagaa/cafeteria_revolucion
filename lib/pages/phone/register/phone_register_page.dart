import 'package:cafeteria_revolucion/pages/phone/register/phone_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneRegisterPage extends StatelessWidget {


  PhoneRegisterController con = Get.put(PhoneRegisterController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomSheet: _buttonContinuar(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body:
      Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agrega tu numero de telefono',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Te enviaremos un código de verificación',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Número de Teléfono',
                border: OutlineInputBorder(),
              ),
              initialCountryCode: 'MX',
              initialValue: "",
              onChanged: (phoneNumber) {
                con.phoneNumber.value = phoneNumber.number;
                con.completePhoneNumber.value = phoneNumber.completeNumber;
                con.isoCode.value = phoneNumber.countryISOCode;
                con.countryCode.value = phoneNumber.countryCode;
              },
            ),
          ],
        ),
      ),

    );
  }


  Widget _buttonContinuar(){
    return
      Obx(() =>
          Container(
            height: 90,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.all(15),
              ),
              onPressed: () {
                con.next();
              },
              child:
              con.isLoading.value
                  ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ) :
              Text('Continuar',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  )
              ),
            ),
          ));
  }
}
