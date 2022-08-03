import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/dominio/doctor.dart';

class RegistroMedico {


  RegistroMedico(
   
    this.fecha, 
    this.doctor, 
    this.historia, 
    this.diagnostico, 
    this.plan, 
    this.examenes, 
    this.prescripcion);
  

  DateTime fecha;
  Doctor doctor;
  String historia;
  String diagnostico;
  String plan;
  List<String> examenes;
  String prescripcion;



  static Future<List<RegistroMedico>> fetchRegistros(String id_pac) async {
    final response = await http.get(Uri.parse(
        'https://myonlinedoctorapi.herokuapp.com/api/cita/AceptadasPaciente' +
            id_pac));

    if (response.statusCode == 200) {
      List<RegistroMedico> list = parseRegistros(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Los Registros');
    }
  }

   static List<RegistroMedico> parseRegistros(String responseBody) {
            final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
        return parsed.map<RegistroMedico>((json) => RegistroMedico.fromJson(json)).toList();
      }


  factory RegistroMedico.fromJson(Map<String, dynamic> json) => RegistroMedico(
        DateTime.parse(json["_fecha"]["_fecha"]),
        Doctor.fromJson(json["doctor"]),
        json["_historia"]["_historia"],
        json["_diagnostico"]["_diagnostico"],
        json["_plan"]["_plan"],
        json["_examen"]["_examen"],
        json["_prescripcion"]["_prescripcion"],
       
    
    );






  
}