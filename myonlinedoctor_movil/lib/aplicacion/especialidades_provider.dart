

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../dominio/doctor.dart';
import '../dominio/especialidades.dart';



class EspecialidadesProvider extends ChangeNotifier{
  
  List<Especialidades> especialidadesDisponibles = [Especialidades(id: 0, nombre: '...')];

  EspecialidadesProvider(){
    print('EspecialidadesProvider inicializado');
    this.getOnDisplayEspecialidades();
  }

  getOnDisplayEspecialidades() async{
    print('getOnDisplayEspecialidades');

    const url = 'https://myonlinedoctorapi.herokuapp.com/api/doctor/Especialidades';
    final response = await http.get(Uri.parse(url));
    final especialidades = Especialidades.parseEspecialidades(response.body);


    print(especialidades);
    this.especialidadesDisponibles.addAll(especialidades);
    notifyListeners();

    final responseDoc =  await http.get(Uri.parse('https://myonlinedoctorapi.herokuapp.com/api/doctor/PorId088e361d-3ddf-46f4-8059-3406e189e2a9'));

    //final resultado2Doc = Doctor.fromJson(json.decode(responseDoc.body));
    

    print('resultado2Doc: ');

   final resultado = json.decode(responseDoc.body);

    print(json.decode(responseDoc.body)[0]['doctor']['_nombre']['_primerNombre']);

    print(resultado[0]['imagen']);

    print(Doctor(
      apellido:resultado[0]['doctor']['_apellido']['_primerApellido'], 
      
      especialidades:Especialidades.parseEspecialidadesLista(resultado[0]['doctor']['_especialidad']),
       genero: resultado[0]['genero'],
       id: resultado[0]['doctor']['_id']['_id'], 
       imagen: resultado[0]['imagen'], 
       nombre: resultado[0]['doctor']['_nombre']['_primerNombre'],
       ));
    


    
  }


}