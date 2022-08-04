import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

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

  static Future<Paciente> fetchPaciente(String correo_pac) async {
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/paciente/porcorreo' +
            correo_pac));

    if (response.statusCode == 200) {
      Paciente paciente = Paciente.fromMap(response.body);
      return paciente;
    } else {
      throw Exception('Error al Cargar Paciente');
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }


  
  
  factory Paciente.fromMap(String str) => Paciente.fromJson(json.decode(str));
    
    factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        id_paciente: json["_idPaciente"]["_id"],
        usuario: json["_correo"]["_correo"],
        contrasena: '',
        primerNombre: json["_nombre"]["_primerNombre"],
        segundoNombre: json["_nombre"]["_segundoNombre"],
        primerApellido: json["_apellido"]["_primerApellido"],
        segundoApellido: json["_apellido"]["_segundoApellido"],
        genero: json["_genero"]["_genero"], 
        latitud: '', 
        longitud: '', 
        imagen: 'https://i.ibb.co/fN9c7QF/mujer11.jpg'
        
    );

    
}
