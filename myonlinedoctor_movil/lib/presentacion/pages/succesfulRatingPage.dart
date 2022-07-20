// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/homePage.dart';

import 'doctores_page.dart';
import 'helpers/appcolors.dart';

class SuccesfulRatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Calificar')
        ],
        backgroundColor: AppColors.MAINCOLOR3,
        selectedItemColor: AppColors.WHITE,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: <Color>[AppColors.MAINCOLOR1, AppColors.MAINCOLOR2])),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconoExito(),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('¡Gracias por tu evaluación!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.BLACK,
                    fontSize: 30,
                    fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
                'Apreciamos tus opiniones y las tomaremos en cuenta para brindarte un mejor servicio.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.GREY,
                    fontSize: 17,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: 80,
          ),
          regresar(context)
        ],
      ),
    );
  }
}

Widget regresar(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DoctoresPage()));
      },
      child: Text('Regresar'),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          maximumSize: const Size(double.infinity, 50),
          primary: AppColors.MAINCOLOR3,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget iconoExito() {
  return Icon(
    Icons.check_circle,
    color: AppColors.MAINCOLOR3,
    size: 80,
  );
}
