// ignore_for_file: must_be_immutable, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/aplicacion/servicio_cita/CitaService.dart';
import 'package:myonlinedoctor_movil/aplicacion/trazabilidad/AnalyticsService.dart';
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/locator.dart';
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
  String? tipoCita = '';
  String? motivo = '';
  AnalyticsService analyticsService = locator.get<AnalyticsService>();
  CitaService citaService = locator.get<CitaService>();
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
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: DropdownButton<Especialidades>(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      items: items.map<DropdownMenuItem<Especialidades>>(
                          (Especialidades a) {
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
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text('Presencial'),
                    onChanged: (String? value) {
                      setState(() {
                        tipoCita = value;
                      });
                    },
                    value: 'PRESENCIAL',
                    groupValue: tipoCita,
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('Virtual'),
                    onChanged: (String? value) {
                      setState(() {
                        tipoCita = value;
                      });
                    },
                    value: 'VIRTUAL',
                    groupValue: tipoCita,
                  ),
                )
              ],
            ),
            TextFormField(
              autofocus: false,
              initialValue: '',
              onChanged: (String value) {
                setState(() {
                  motivo = value;
                });
              },
              validator: (value) {
                if (value == null) return 'Campo requerido';

                if (value.length <= 1) return 'Campo requerido';
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'Motivo de cita',
                labelText: 'Motivo',
                suffixIcon: Icon(
                  Icons.app_registration_rounded,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: citaForm.isloading ||
                        opcionporDefecto == 'Especialidad' ||
                        tipoCita == '' ||
                        motivo == ''
                    ? null
                    : () async {
                        if (citaForm.esSolicitudValida()) {
                          citaForm.isloading = true;
                          //VALIDAR SI LA SOLICITUD DE LA CITA ES VALIDA
                          //SE HACE LA SOLICITUD AQUI
                          citaService.requestCita(motivo!, tipoCita!,
                              especialidad!, id_doctor, id_paciente);
                          analyticsService.logSolicitudCita(especialidad!);
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
                )),
          ],
        ),
      ),
    );
  }
}
