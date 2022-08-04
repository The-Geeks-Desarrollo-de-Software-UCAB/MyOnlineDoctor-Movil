import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/dominio/doctor.dart';
import 'package:myonlinedoctor_movil/dominio/especialidades.dart';
import 'package:provider/provider.dart';

import '../aplicacion/doctores_provider.dart';
import '../aplicacion/especialidades_provider.dart';
import '../data.dart';
import 'paciente.dart';

import 'package:flutter/material.dart';

enum AppoimentState { CANCELADA, RECHAZADA, AGENDADA, SOLICITADA }

class Cita {

  
  Cita({
    required this.idCita,
    required this.fecha,
    required this.duracion,
    required this.tipoCita,
    required this.estadoCita,
    required this.motivo,
    required this.calificacion,
     required this.doctor,
     required this.doctorid,
    //required this.paciente,
  });

  String idCita;
  DateTime fecha;
  int duracion;
  String tipoCita;
  String estadoCita;
  String motivo;
  dynamic calificacion;
  Doctor doctor;
  String doctorid;
  //Paciente paciente;

  static Future<List<Cita>> fetchCitas(String id_pac) async {
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/cita/AceptadasPaciente' +
            id_pac));

    print(id_pac);        

    if (response.statusCode == 200) {
      List<Cita> list = parseCitas(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  static Future<List<Cita>> fetchCitasAgendadas(String id_pac) async {
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/cita/AgendadasPaciente' +
            id_pac));

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

  factory Cita.fromJson(Map<String, dynamic> json)  => Cita(
        idCita: json["_identificador"]["_id"],
        fecha: DateTime.parse(json["_fecha"]["_fecha"]),
        duracion: json["_duracion"]["_duracion"],
        tipoCita: json["_tipo"],
        estadoCita: json["_estado"],
        motivo: json["_motivo"]["_motivo"],
        calificacion: json["_calificacion"]["_puntuacion"],
        doctor:  Doctor(
          id: '0',
          nombre: 'Ejemplo',
          apellido: 'Ejemplo',
          genero: 'M',
          imagen:
              'https://images.unsplash.com/photo-1559035636-a99258c3d0b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          especialidades: [Especialidades(id: 1, nombre: 'Cardiologia')],
          calificaciones: 2.0),
          doctorid: json["_identificadorDoctor"]["_id"]
        //paciente: Paciente.fromJson(json["paciente"]),
      );
}
