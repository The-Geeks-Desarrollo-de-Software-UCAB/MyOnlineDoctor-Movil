import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/aplicacion/servicio_cita/CitaService.dart';
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/locator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../succesfulRatingPage.dart';
import 'appcolors.dart';

class Rating extends StatefulWidget {
  Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _Rating();
}

class _Rating extends State<Rating> {
  String id_cita = "7ee4c73a-607f-4685-a53e-69aec0d45d";
  double ratingValue = 0;
  bool isloading = false;
  CitaService citaService = locator.get<CitaService>();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (rating) {
            isloading = true;
            ratingValue = rating;
            print(ratingValue);
            setState(() {});
          },
          starCount: 5,
          rating: ratingValue,
          size: 40.0,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half_outlined,
          color: Colors.cyan,
          borderColor: Colors.cyan,
          spacing: 0.0),
      SizedBox(
        height: 60,
      ),
      ElevatedButton(
        child: Text('Enviar'),
        onPressed: () {
          citaService.terminarCita(id_doctor, id_cita);
          citaService.calificarCita(id_cita, ratingValue, id_paciente);
          print(ratingValue);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuccesfulRatingPage()));
        },
        style: ElevatedButton.styleFrom(
            primary: AppColors.MAINCOLOR3,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      )
    ]);
  }
}
