// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);
//import 'dart:js';

import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

import 'package:myonlinedoctor_movil/dominio/especialidades.dart';

class Doctor {
  Doctor(
      {required this.id,
      required this.nombre,
      required this.apellido,
      required this.genero,
      required this.imagen,
      required this.especialidades,
       this.calificaciones});

  String id;
  String nombre;
  String apellido;
  String genero;
  String imagen;
  List<Especialidades> especialidades;
  double? calificaciones;
  // factory Doctor.fromJson(String str) => Doctor.fromMap(json.decode(str));

  List<Object?> get props => [id, nombre, apellido, genero, imagen];

  static Future<List<Doctor>> fetchDoctores(String especialidad) async {

    String ruta;  
    if(especialidad ==''){
      ruta ='http://192.168.24.241:3000/api/doctorSpecialty/all';
    }else{
      ruta = 'http://192.168.24.241:3000/api/doctorSpecialty/by'+especialidad;
    }
    final response = await http.get(Uri.parse(ruta));
    if (response.statusCode == 200) {
      List<Doctor> list = parseDoctores(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  static List<Doctor> parseDoctores(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Doctor>((json) => Doctor.fromJson(json)).toList();
  }

  List<Especialidades> listaEspecialidades(List<dynamic> l) {
    List<Especialidades> result = List.empty();
    for (var item in l) {
      result = (Especialidades.parseEspecialidades(item));
    }
    return result;
  }

  factory Doctor.fromJson(Map<dynamic, dynamic> json) {
    return Doctor(
        id: json["id_doctor"],
        nombre: json["primerNombre"],
        apellido: json["primerApellido"],
        genero: json["genero"],
        imagen: json["imagen"],
        especialidades: json["especialidades"] == null ? [Especialidades(id: 1, nombre: 'Cardiologia')] : Especialidades.parseEspecialidadesLista(json["especialidades"]) ,
          //  Especialidades.parseEspecialidadesLista(json["especialidades"]),
        calificaciones: json["promedioCalificacion"]);
  }

  String getEspecialidadesToString() {
    String especialidades = '';

    for (var i in this.especialidades) {
      especialidades = especialidades + i.nombre + ', ';
    }
    final pos = especialidades.length - 2;
    final resultado = especialidades.substring(0, pos) + '.';

    return resultado;
  }

  List<Especialidades> getespecialidades() {
    return this.especialidades;
  }
}
