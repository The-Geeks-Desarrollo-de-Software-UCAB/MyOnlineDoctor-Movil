import 'dart:convert';

import 'package:http/http.dart' as http;

class CitaService {
  String url = "localhost";
  crearCita(dynamic obj) {}

  requestCita(dynamic obj) async {
    crearCita(obj);
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(obj),
    );
  }
}
