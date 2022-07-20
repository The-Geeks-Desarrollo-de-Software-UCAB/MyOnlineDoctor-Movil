import 'dart:convert';

import 'package:http/http.dart' as http;

class CitaService {
  String url = "http://localhost:3000/api/cita/Solicitar";
  crearCita(dynamic obj) {}

  requestCita(dynamic obj) async {
    crearCita(obj);
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(obj),
    );
  }
}
