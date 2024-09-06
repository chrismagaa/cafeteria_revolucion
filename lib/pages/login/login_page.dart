import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';


class LoginPage extends StatelessWidget {


  LoginController con = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
        ),
        bottomNavigationBar: Container(height: 60, child: _textDontHaveAccount()),
        body: _contentLogin(context)
    );
  }

  /*

  Widget _cerrar(){
    return
      SafeArea(child:
      Container(
        width: double.infinity,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Row(
          children: [
            Spacer(),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.close, size: 30),
              onPressed: () =>// con.goToClientPageLikeInvitado(),
            )
          ],
        ),
      ));
  }

   */

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



  Widget _textAppName() {
    return Text("BARBATUS",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black));
  }

  Widget _contentLogin(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFiledEmail(),
            _textFiledPassword(),
            _forgotPassword(),
            _buttonLogin(),
            _or(),
            _signWithGoogle(),
          ],
        ),
      ),
    );
  }

  Widget _forgotPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => con.goToForgotPasswordPage(),
            child: Text("¿Olvidaste tu contraseña?", style: TextStyle(fontSize: 17, color: Colors.black)),
          ),
        ],
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

  Widget _buttonLogin(){
    return
      Obx(() =>
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: ElevatedButton(
              onPressed: () => con.login(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 15)),
              child:
              con.isLoading.value
                  ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  :
              Text(
                  "Iniciar sesión",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
            ),

          ));
  }

  Widget _textFiledEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          labelText: 'Correo electrónico',
          suffixIcon: Icon(Icons.email, color: Colors.grey[600]),
        ),
      ),
    );
  }

  Widget _textFiledPassword() {
    return
      Obx(() =>
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: TextField(
              controller: con.passwordController,
              keyboardType: TextInputType.text,
              obscureText: !con.showPassword.value,
              decoration: InputDecoration(
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(con.showPassword.value ? Icons.visibility : Icons.visibility_off, color: Colors.grey[600]),
                    onPressed: () => con.showPassword.value = !con.showPassword.value,)
              ),
            ),
          ));
  }

  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 45, left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Inicio de sesión',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Bienvenido, ingresa tus datos para continuar',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700]
              )),
        ],
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
            style: TextStyle(fontSize: 17,
            )
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: () => con.goToRegisterPage(),
          child: Text(
            "Registrate aquí",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }

  Widget _signWithGoogle(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
      child: ElevatedButton.icon(
        onPressed: () => {
          con.loginWithGoogle()
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


}
