import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class CitaService {
  String url = "http://192.168.88.15:3000/api/cita/Solicitar";
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
}
