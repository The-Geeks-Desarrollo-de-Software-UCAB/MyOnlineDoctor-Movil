import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/resultado_cita_Acept_Rech.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/resultado_solicitud_cita.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../aplicacion/servicio_cita/CitaService.dart';
import '../../aplicacion/videollamada/call.dart';
import '../../dominio/cita.dart';
import '../../locator.dart';
import 'detalles_doctor.dart';

class DetalleCitaSolicitada extends StatefulWidget {
  Cita cita;
  DetalleCitaSolicitada({Key? key, required this.cita}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetalleCitaSolicitada();
}

class _DetalleCitaSolicitada extends State<DetalleCitaSolicitada> {
  CitaService citaService = locator.get<CitaService>();

  @override
  Widget build(BuildContext context) {
    //DateTime? fecha = widget.cita.date;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cita - My Online Doctor'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //FotoNombre(doctor: widget.cita.doctor),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Fecha: ' +
                        widget.cita.fecha.toString().substring(8, 11) +
                        '-' +
                        widget.cita.fecha.toString().substring(5, 8) +
                        widget.cita.fecha.toString().substring(0, 4)),
                    //Text('Fecha: '+widget.cita.fecha.day.toString()+ '-'+widget.cita.fecha.month.toString()+'-'+widget.cita.fecha.year.toString()),
                    const SizedBox(width: 30),
                    Text('Hora: ' +
                        widget.cita.fecha.toString().substring(11, 16)),
                    //Text('Hora: '+widget.cita.fecha.hour.toString()+ ':'+widget.cita.fecha.minute.toString()+''+widget.cita.fecha.second.toString()),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        citaService.rechazarCita(
                            widget.cita.idCita, id_paciente);

                        final route = MaterialPageRoute(
                            builder: (context) => ResultadoAceptarRechazarCita(
                                  resultado: 'CITA RECHAZADA',
                                ));
                        //VALIDAR SI LA SOLICITUD DE LA CITA ES VALIDA
                        Navigator.pushAndRemoveUntil(
                            context, route, (route) => false);
                      },
                      child: const Text('Rechazar'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(120, 40),
                          primary: Colors.red),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        citaService.aceptarCita(
                            widget.cita.idCita, id_paciente);
                        final route = MaterialPageRoute(
                            builder: (context) => ResultadoAceptarRechazarCita(
                                  resultado: 'CITA ACEPTADA',
                                ));
                        //VALIDAR SI LA SOLICITUD DE LA CITA ES VALIDA
                        Navigator.pushAndRemoveUntil(
                            context, route, (route) => false);
                      },
                      child: const Text('Aceptar'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(120, 40),
                          primary: Color.fromARGB(255, 82, 215, 87)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
