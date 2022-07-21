import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/dominio/doctor.dart';
import 'package:myonlinedoctor_movil/dominio/especialidades.dart';

import '../data.dart';
import 'paciente.dart';

import 'package:flutter/material.dart';

enum AppoimentState { CANCELADA, RECHAZADA, AGENDADA, SOLICITADA }



class Cita {
    Cita({
      required  this.idCita,
      required  this.fecha,
      required  this.duracion,
      required  this.tipoCita,
      required  this.estadoCita,
      required   this.motivo,
      required   this.calificacion,
      required   this.doctor,
      required   this.paciente,
    });

    String idCita;
    DateTime fecha;
    int duracion;
    String tipoCita;
    String estadoCita;
    String motivo;
    dynamic calificacion;
    Doctor doctor;
    Paciente paciente;

  static Future<List<Cita>> fetchCitas(String idDoctor) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/cita/AgendadasPacientefdbf1a1a-be97-4337-a029-f45df5a2e0ea'));

    if (response.statusCode == 200) {
      List<Cita> list = parseCitas(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  static List<Cita> parseCitas(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Cita>((json) => Cita.fromJson(json)).toList();
  }

    factory Cita.fromJson(Map<String, dynamic> json) => Cita(
        idCita: json["id_cita"],
        fecha: DateTime.parse(json["fecha"]),
        duracion: json["duracion"],
        tipoCita: json["tipoCita"],
        estadoCita: json["estadoCita"],
        motivo: json["motivo"],
        calificacion: json["calificacion"],
        doctor: Doctor.fromJson(json["doctor"]),
        paciente: Paciente.fromJson(json["paciente"]),
    );

   
}



    

