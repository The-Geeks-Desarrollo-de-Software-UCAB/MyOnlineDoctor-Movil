import 'package:flutter/material.dart';

import '../../main.dart';
import 'detalles_doctor.dart';
import 'doctores_page.dart';
import 'helpers/appcolors.dart';

class ResultadoAceptarRechazarCita extends StatelessWidget {
  ResultadoAceptarRechazarCita({Key? key, required this.resultado}) : super(key: key);

  String resultado;
  @override
  Widget build(BuildContext context) {
    dynamic color = Color.fromARGB(255, 5, 190, 100);
    dynamic icon = Icons.check_circle_outline;
    String mensaje = '';
    if (resultado != 'CITA ACEPTADA') {
      color = Color.fromARGB(255, 226, 8, 59);
      icon = Icons.cancel_sharp;
      
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            body: CustomScrollView(slivers: [
          CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(top: 80),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(

                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: color,
                          size: 70,
                        ),
                        Expanded(
                          child: Text(
                            resultado,
                            style: TextStyle(fontSize: 25, color: color),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      mensaje,
                      style: TextStyle(fontSize: 20, color: color),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final route = MaterialPageRoute(
                            builder: (context) => DoctoresPage());
                        //VALIDAR SI LA SOLICITUD DE LA CITA ES VALIDA
                        Navigator.pushAndRemoveUntil(
                            context, route, (route) => false);
                      },
                      child: Text('Regresar'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          maximumSize: const Size(double.infinity, 50),
                          primary: AppColors.MAINCOLOR3,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ]),
            )
          ]))
        ])));
  }
}