import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../dominio/cita.dart';

class GetRequestedAppoiment {
  Future<List<Cita>> getAppoiment() async {
    final response = await http.get(Uri.parse(
        "https://gentle-river-68727.herokuapp.com/doctors")); // modificar con url de conexion con API
    final List<Cita> appoiment = <Cita>[];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonAppoiments = jsonDecode(body);

      print(jsonAppoiments); // punto de control.

      for (var appoiment in jsonAppoiments) {
        appoiment.add(Cita('Patricio', 'Lesion muscular', 'prueba 1',
            AppoimentState.SOLICITADA)); //modificar
      }
    } else {
      throw Exception("Fallo la conexion");
    }

    return appoiment;
  }
}

//Test
class GetAppoimentMock {
  Future<List<Cita>> getAppoiment() async {
    final response = await Future.delayed(
        const Duration(seconds: 2),
        () =>
            '[{"paciente":"Patricio", "motivo":"Lesion muscular","id_cita":"prueba 1"},{"paciente":"Pablo","motivo": "Se cayo","id_cita":"prueba 2"},{"paciente":"Rafael","motivo": "Picazon","id_cita":"prueba 3"},{"paciente":"DuaLipa","motivo": "exceso de belleza","id_cita":"prueba 4"}]');

    final List<Cita> appoiment = <Cita>[];

    final List<dynamic> jsonAppoiments = jsonDecode(response);
    print('estoy decodificando');
    // punto de control.

    for (var appoiments in jsonAppoiments) {
      appoiment.add(Cita(appoiments["paciente"], appoiments["motivo"],
          appoiments["id_cita"], AppoimentState.SOLICITADA));
    }

    return appoiment;
  }
}
