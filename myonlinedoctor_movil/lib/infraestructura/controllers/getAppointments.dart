import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/dominio/doctor.dart';
import 'package:myonlinedoctor_movil/dominio/paciente.dart';
import 'dart:async';
import 'dart:convert';

import '../../dominio/cita.dart';
import '../../dominio/especialidades.dart';

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
        appoiment.add(Cita(
          Paciente(
              id_paciente: 5,
              usuario: 'Vicente',
              contrasena: '1234',
              primerNomre: 'Vicente',
              segundoNombre: 'Rafael',
              primerApellido: 'Mirabal',
              segundoApellido: 'Bucci',
              genero: 'M',
              longitud: '10 11 12',
              latitud: '10 11 12',
              promedioCalificacion: 10,
              imagen: 'https://i.ibb.co/KbQL38r/hombre5.jpg'),
          'Lesion muscular',
          'prueba 1',
          AppoimentState.SOLICITADA,
          Doctor(
              id: '1',
              nombre: 'David',
              apellido: 'Rey',
              genero: 'M',
              imagen: 'https://i.ibb.co/KbQL38r/hombre5.jpg',
              especialidades: [
                Especialidades(id: 1, nombre: 'Cardiologia'),
                Especialidades(id: 2, nombre: 'Traumatologia')
              ],
              calificaciones: 
                4.0
              ),
        )); //modificar
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
      appoiment.add(Cita(
        Paciente(id_paciente: 5 , 
                                    usuario: 'Vicente', 
                                    contrasena: '1234', 
                                    primerNomre: 'Vicente', 
                                    segundoNombre: 'Rafael', 
                                    primerApellido: 'Mirabal', 
                                    segundoApellido: 'Bucci', 
                                    genero: 'M', 
                                    longitud: '10 11 12', 
                                    latitud: '10 11 12', 
                                    promedioCalificacion: 10, 
                                    imagen: 'https://i.ibb.co/KbQL38r/hombre5.jpg'),
        appoiments["motivo"],
        appoiments["id_cita"],
        AppoimentState.SOLICITADA,
        Doctor(
            id: '1',
            nombre: 'David',
            apellido: 'Rey',
            genero: 'M',
            imagen: 'https://i.ibb.co/KbQL38r/hombre5.jpg',
            especialidades: [
              Especialidades(id: 1, nombre: 'Cardiologia'),
              Especialidades(id: 2, nombre: 'Traumatologia')
            ],
            calificaciones: 
              4.0
            ),
      ));
    }

    return appoiment;
  }
}
