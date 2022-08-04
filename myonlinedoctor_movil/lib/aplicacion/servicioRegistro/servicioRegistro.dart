import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/dominio/cita.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class RegistroService {
  String url = "https://myonlinedoctorapi.herokuapp.com/api/cita/Solicitar";
  registrarPaciente(String usuario, String contrasena, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido, String genero,
            int altura, String correo, String numeroMovil, DateTime fechaNacimiento, String estadoSuscripcion, String alergia, String operacion, int peso, int antecedente)     
            {
            Map<String, dynamic> body = {   
              "id_paciente": Uuid().v4(),
              "usuario": usuario,
              "contrasena": contrasena,
              "primerNombre": primerNombre,
              "segundoNombre": segundoNombre,
              "primerApellido": primerApellido,
              "segundoApellido": segundoApellido,
              "genero": genero,
              "altura": altura,
              "correo": correo,
              "numeroMovil": numeroMovil,
              "fechaNacimiento": fechaNacimiento,
              "estadoSuscripcion": estadoSuscripcion,
              "alergia": alergia,
              "operacion": operacion,
              "peso": peso,
              "antecedente": antecedente
            };
    }

  requestCita(String usuario, String contrasena, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido, String genero,
              int altura, String correo, String numeroMovil, DateTime fechaNacimiento, String estadoSuscripcion, String alergia, String operacion, int peso, int antecedente
    ) async {
              print(Uri.parse(url));
               return await http.post(Uri.parse(url),
             body: registrarPaciente( usuario, contrasena,  primerNombre,  segundoNombre, primerApellido, segundoApellido, genero,
            altura,  correo, numeroMovil,  fechaNacimiento,  estadoSuscripcion,  alergia,  operacion,peso,  antecedente
          ));
  
  }

 
}