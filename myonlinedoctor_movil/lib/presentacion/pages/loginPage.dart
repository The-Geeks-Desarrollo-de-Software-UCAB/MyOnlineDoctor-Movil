// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/doctores_page.dart';

import 'helpers/appcolors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              logoDegradado(),
              titulo(),
              SizedBox(
                height: 40,
              ),
              campoRellenable(texto: "Email"),
              campoContrasena(),
              SizedBox(
                height: 50,
              ),
              botonEntrar(context),
            ],
          ))
        ],
      ),
    ));
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

Widget campoRellenable({texto: String}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    child: TextField(
      decoration: InputDecoration(
          hintText: texto,
          prefixIcon: Icon(
            Icons.mail,
            color: AppColors.GREY,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.GREY),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.GREY),
              borderRadius: BorderRadius.circular(20)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.RED),
              borderRadius: BorderRadius.circular(20))),
    ),
  );
}

Widget campoContrasena() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Contraseña",
          prefixIcon: Icon(
            Icons.lock,
            color: AppColors.GREY,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.GREY),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.GREY),
              borderRadius: BorderRadius.circular(20)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.RED),
              borderRadius: BorderRadius.circular(20))),
    ),
  );
}

Widget botonEntrar(context) {
  return ElevatedButton(
    child: Text('Entrar'),
    onPressed: () => {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DoctoresPage()))
    },
    style: ElevatedButton.styleFrom(
        primary: AppColors.MAINCOLOR3,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}
