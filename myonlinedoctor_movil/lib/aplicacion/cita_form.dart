// ignore_for_file: must_be_immutable, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';

import '../dominio/doctor.dart';
import '../dominio/especialidades.dart';
import '../presentacion/pages/detalles_doctor.dart';
import '../presentacion/pages/resultado_solicitud_cita.dart';
import 'citas_provider.dart';
import 'package:provider/provider.dart';

class SolicitarCitaForm extends StatefulWidget {
  Doctor doctor;
  SolicitarCitaForm({Key? key, required this.doctor}) : super(key: key);

  @override
  State<SolicitarCitaForm> createState() => SolicitarCitaFormState();
}

class SolicitarCitaFormState extends State<SolicitarCitaForm> {
  String opcionporDefecto = 'Especialidad';
  String? especialidad = '';

  @override
  Widget build(BuildContext context) {
    final citaForm = Provider.of<SolicitudCitaProvider>(context);
    citaForm.doctor = this.widget.doctor;
    final items = this.widget.doctor.getespecialidades();
    // opcionporDefecto = items[0].nombre;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: citaForm.formKey,
        child: Column(
          children: [
            DropdownButton<Especialidades>(
                items: items
                    .map<DropdownMenuItem<Especialidades>>((Especialidades a) {
                  return DropdownMenuItem<Especialidades>(
                    value: a,
                    child: Text(a.nombre),
                  );
                }).toList(),
                onChanged: (Especialidades? a) => setState(() {
                      citaForm.especialidad = a;
                      especialidad = a?.nombre;
                      opcionporDefecto = especialidad!;
                      print(opcionporDefecto);
                    }),
                hint: Text(opcionporDefecto)),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed:
                  citaForm.isloading || opcionporDefecto == 'Especialidad'
                      ? null
                      : () async {
                          if (citaForm.esSolicitudValida()) {
                            citaForm.isloading = true;
                            //VALIDAR SI LA SOLICITUD DE LA CITA ES VALIDA
                            String result = 'CITA SOLICITADA';
                            final route = MaterialPageRoute(
                                builder: (context) => ResultadoSolicitudCita(
                                      resultado: result,
                                    ));
                            await Future.delayed(Duration(seconds: 2));
                            citaForm.isloading = false;
                            Navigator.push(context, route);
                          }
                          AgendarCita;
                        },
              child: Text(citaForm.isloading ? 'Espere' : 'Solicitar Cita'),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  maximumSize: const Size(double.infinity, 50),
                  primary: AppColors.MAINCOLOR3,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
