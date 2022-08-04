import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../dominio/doctor.dart';
import '../dominio/especialidades.dart';



class DoctoresProvider extends ChangeNotifier {

  Doctor doctor= Doctor(
          id: '0',
          nombre: 'Ejemplo',
          apellido: 'Ejemplo',
          genero: 'M',
          imagen:
              'https://images.unsplash.com/photo-1559035636-a99258c3d0b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          especialidades: [Especialidades(id: 1, nombre: 'Cardiologia')],
          calificaciones: 2.0);

  DoctoresProvider() {
    print('DoctoresProviders inicializado');
    this.getOnDisplayDoctores();
  }

  getOnDisplayDoctores() async {
    //const url = 'http://10.0.2.2:3000/doctor/get/';
    //final response = await http.get(Uri.parse(url));
    print('Hellooo');
    //Future ListaDoctores =
     //   Doctor.fetchDoctores('http://10.0.2.2:3000/doctor/get/');
    //Future ListaEpecialidades = Especialidades.fetchEspecialidades();
   // print(ListaEpecialidades);
    //final doctorResponse =Doctor.fromMap(response.body);
    // List<Doctor> list = parseDoctores(response.body);
  }

   getDoctorPorId(String id) async {

    final response =  await http.get(Uri.parse('https://myonlinedoctorapi.herokuapp.com/api/doctor/PorId'+ id));

    final resultado = json.decode(response.body);

    doctor.apellido = resultado[0]['doctor']['_apellido']['_primerApellido'];
    doctor.especialidades = Especialidades.parseEspecialidadesLista(resultado[0]['doctor']['_especialidad']);
    doctor.genero = resultado[0]['genero'];
    doctor.id = resultado[0]['doctor']['_id']['_id'];
    doctor.imagen = resultado[0]['imagen'];
    doctor.nombre = resultado[0]['doctor']['_nombre']['_primerNombre'];

     notifyListeners();
  

  }




  // Await the http get response, then decode the json-formatted response.

}
