import 'dart:convert';
import 'dart:ffi';

class Paciente {
  Paciente(
      {required this.id_paciente,
      required this.usuario,
      required this.contrasena,
      required this.primerNombre,
      required this.segundoNombre,
      required this.primerApellido,
      required this.segundoApellido,
      required this.genero,
      required this.longitud,
      required this.latitud,
       this.imagen});

  String id_paciente;
  String usuario;
  String contrasena;
  String primerNombre;
  String segundoNombre;
  String primerApellido;
  String segundoApellido;
  String genero;
  String longitud;
  String latitud;
  
  String? imagen;


  //factory Paciente.fromJson(String str) => Paciente.fromMap(json.decode(str));

    

    factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        id_paciente: json["id_paciente"],
        usuario: json["usuario"],
        contrasena: json["contrasena"],
        primerNombre: json["primerNombre"],
        segundoNombre: json["segundoNombre"],
        primerApellido: json["primerApellido"],
        segundoApellido: json["segundoApellido"],
        genero: json["genero"], 
        latitud: '', 
        longitud: '', 
        
    );

    
}
