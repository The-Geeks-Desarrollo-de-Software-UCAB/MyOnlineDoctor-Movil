import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/dominio/cita.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class CitaService {
  String url = "https://myonlinedoctorapi.herokuapp.com/api/cita/Solicitar";
  crearCita(String motivo, String tipo, String especialidad, String doctor,
      String paciente) {
    Map<String, dynamic> body = {
      "id_cita": Uuid().v4(),
      "duracion": "1",
      "tipo": tipo,
      "motivo": motivo,
      "id_paciente": paciente,
      "id_doctor": doctor,
    };
    print(json.encode(body));
    return body;
  }

  requestCita(String motivo, String tipo, String especialidad, String doctor,
      String paciente) async {
    print(Uri.parse(url));
    return await http.post(Uri.parse(url),
        body: crearCita(motivo, tipo, especialidad, doctor, paciente));
  }

  terminarCita(String id_doctor, String id_cita) async {
    return await http.put(
        Uri.parse("https://myonlinedoctorapi.herokuapp.com/api/cita/Finalizar"),
        body: {"id_doctor": id_doctor, "id_cita": id_cita});
  }

  calificarCita(String id, double calificacion, String id_paciente) async {
    String val = calificacion.toString();
    return await http.put(
        Uri.parse("https://myonlinedoctorapi.herokuapp.com/api/cita/Calificar"),
        body: {"id_paciente": id_paciente, "id_cita": id, "calificacion": val});
  }

  aceptarCita(String id, String id_paciente) async {
    return await http.put(
        Uri.parse(
            "https://myonlinedoctorapi.herokuapp.com/api/cita/AceptarFecha"),
        body: {"id_paciente": id_paciente, "id_cita": id});
  }

  rechazarCita(String id, String id_paciente) async {
    return await http.put(
        Uri.parse("https://myonlinedoctorapi.herokuapp.com/api/cita/Rechazar"),
        body: {"id_paciente": id_paciente, "id_cita": id});
  }

  agendadasPaciente(String id_paciente) async {
    return await http.get(Uri.parse(
        "https://myonlinedoctorapi.herokuapp.com/api/cita/AceptadasPaciente" +
            id_paciente));
  }
}
