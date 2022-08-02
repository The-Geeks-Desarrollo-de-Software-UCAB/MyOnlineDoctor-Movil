// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/doctores_page.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/botonReusable.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/reusableTextField.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/homePage.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/registerPage.dart';

import 'helpers/appcolors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool isAPIcallProcess = false;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  logoDegradado(),
                  titulo(),
                  SizedBox(
                    height: 40,
                  ),
                  reusableTextField(
                      'Email', Icons.email, false, _emailTextController),
                  SizedBox(
                    height: 15,
                  ),
                  reusableTextField(
                      'Contraseña', Icons.lock, true, _passwordTextController),
                  SizedBox(
                    height: 50,
                  ),
                  botonReusable(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                  SizedBox(
                    height: 18,
                  ),
                  signUpOption()
                ],
              ),
            )),
          )
        ],
      ),
    ));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿No tienes una cuenta?",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ));
          },
          child: const Text(" ¡Registrate!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        )
      ],
    );
  }
}

Widget logoDegradado() {
  return Image.network(
    'https://i.ibb.co/sRhR8SK/logo2.png',
    height: 150,
    width: 150,
  );
}

Widget titulo() {
  return Text(
    'My Online Doctor',
    textAlign: TextAlign.center,
    style: TextStyle(
        color: AppColors.MAINCOLOR3, fontSize: 30, fontWeight: FontWeight.bold),
  );
}
