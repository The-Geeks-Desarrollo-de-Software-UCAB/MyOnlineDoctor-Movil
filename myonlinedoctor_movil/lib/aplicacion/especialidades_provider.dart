

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/dominio/paciente.dart';

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
    //final paciente2 =  await Paciente.fetchPaciente('pedrito@gmail.com');
   // print(paciente2.id_paciente + '----------------------------------------->');

    print(Doctor(
      apellido:resultado[0]['doctor']['_apellido']['_primerApellido'], 
      
      especialidades:Especialidades.parseEspecialidadesLista(resultado[0]['doctor']['_especialidad']),
       genero: resultado[0]['genero'],
       id: resultado[0]['doctor']['_id']['_id'], 
       imagen: resultado[0]['imagen'], 
       nombre: resultado[0]['doctor']['_nombre']['_primerNombre'],
       ));

       //final respuesta = await http.get(Uri.parse( 'https://myonlinedoctorapi.herokuapp.com/api/paciente/porcorreopedrito@gmail.com'));



      // final respuestaDecodificada = json.decode(respuesta.body);

       //final paciente = Paciente.fromJson(respuestaDecodificada);

       
      //final paciente2 =  await Paciente.fetchPaciente('pedrito@gmail.com');

       //print(paciente2.primerNombre);
        //print(paciente2.segundoNombre);

      // print(respuestaDecodificada['_correo']['_correo']);
      // print(Paciente.fromJson(respuestaDecodificada));

     


     //print(paciente2);


    


    
  }


}