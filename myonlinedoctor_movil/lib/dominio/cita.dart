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
    final response = await http.get(Uri.parse('https://myonlinedoctorapi.herokuapp.com/api/cita/aceptadaspacientee49421aa-6508-4902-aec2-75d519299bb5'));

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
        idCita: Identificador.fromJson(json["_identificador"]).id,
        fecha: Fecha.fromJson(json["_fecha"]).fecha,
        duracion: Duracion.fromJson(json["_duracion"]).duracion,
        tipoCita: json["_tipo"],
        estadoCita:json["_estado"],
        motivo:  Motivo.fromJson(json["_motivo"]).motivo,
        calificacion: json["_calificacion"]["_puntuacion"],
        doctor: Doctor(
                                                              id: '2',
                                                              nombre: 'Carla',
                                                              apellido: 'Cepeda',
                                                              genero: 'F',
                                                              imagen: 'https://i.ibb.co/fN9c7QF/mujer11.jpg',
                                                              especialidades: [
                                                                Especialidades(id: 1, nombre: 'Cardiologia'),
                                                                Especialidades(id: 2, nombre: 'Traumatologia')
                                                              ],
                                                              calificaciones: 3.0), 
        paciente: Paciente(id_paciente: 'id_paciente', usuario: 'Test', contrasena: 'contrasena', primerNombre: 'primerNombre', 
        segundoNombre: 'segundoNombre', primerApellido: 'primerApellido', segundoApellido: 'segundoApellido', genero: 'M', 
        longitud: 'longitud', latitud: 'latitud'),
    );

   
}



class Identificador{

   Identificador({
        required this.id,
    });
   String id;

  factory Identificador.fromJson(Map<String, dynamic> json){
    
    return Identificador(
        id: json["_id"],
    );
  }

}


class Fecha {

  Fecha({
       required  this.fecha,
    });

  DateTime fecha;


  factory Fecha.fromJson(Map<String, dynamic> json) => Fecha(
    fecha: json["_fecha"] == null ? json["_fecha"] : DateTime.parse(json["_fecha"])
  );

}


class Motivo{

   Motivo({
       required  this.motivo,
    });

    String motivo;

     factory Motivo.fromJson(Map<String, dynamic> json) => Motivo(
        motivo: json["_motivo"],
    );

}


class Duracion{

  Duracion({
        required this.duracion,
    });

    int duracion;

     factory Duracion.fromJson(Map<String, dynamic> json) => Duracion(
        duracion: json["_duracion"],
    );

}


class Calificacion{

  Calificacion({
       required  this.puntuacion,
    });

    int puntuacion;


    factory Calificacion.fromJson(Map<String, dynamic> json) => Calificacion(
        puntuacion: json["_puntuacion"] == null ? json["_puntuacion"] : 0,
    );


}
    

