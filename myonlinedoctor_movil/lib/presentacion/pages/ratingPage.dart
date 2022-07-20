// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'helpers/rating.dart';
import 'helpers/appcolors.dart';
import 'succesfulRatingPage.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Calificación de cita"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                  AppColors.MAINCOLOR1,
                  AppColors.MAINCOLOR2
                ])),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Stack(
            children: [
              Center(
                  child: SingleChildScrollView(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  agradecimiento(),
                  SizedBox(
                    height: 20,
                  ),
                  solicitudCalificacion(),
                  SizedBox(
                    height: 40,
                  ),
                  Rating(),
                ],
              )))
            ],
          ),
        ));
  }
}

Widget solicitudCalificacion() {
  return Text('Por favor califica tu experiencia con el doctor.',
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: AppColors.BLACK, fontSize: 19, fontWeight: FontWeight.w400));
}

Widget agradecimiento() {
  return Text('¡Tu opinión nos importa!',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.MAINCOLOR3,
          fontSize: 30,
          fontWeight: FontWeight.w600));
}

Widget cajaComentario() {
  return Container(
    child: TextField(
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Deja aqui tus comentarios...',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.GREY),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.GREY),
            borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}
