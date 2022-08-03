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

  static Future<List<Doctor>> fetchDoctores(String idespecialidad) async {

    String ruta;  
    if(idespecialidad ==''){
      ruta ='https://myonlinedoctorapi.herokuapp.com/api/doctor/Todos';
    }else{
      ruta = 'https://myonlinedoctorapi.herokuapp.com/api/doctor/PorEspecialidad'+idespecialidad;
    }
    final response = await http.get(Uri.parse(ruta));
    if (response.statusCode == 200) {
      List<Doctor> list = parseDoctores(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Doctores');
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
        id: json["_id"]["_id"],
        nombre: json["_nombre"]["_primerNombre"],
        apellido: json["_apellido"]["_primerApellido"],
        genero: 'M',
        imagen: 'https://i.ibb.co/fN9c7QF/mujer11.jpg',
        especialidades: 
            Especialidades.parseEspecialidadesLista(json["_especialidad"]),
           // [ Especialidades(id: 1, nombre: 'Cardiologia'),  Especialidades(id: 2, nombre: 'Traumatologia')],
        calificaciones: json["_promedioCalificacion"]["_promedioCalificacion"]
    );
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
