import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/dominio/paciente.dart';
import 'dart:convert';

import '../dominio/doctor.dart';
import '../dominio/especialidades.dart';



class PacienteProvider extends ChangeNotifier {

 Paciente paciente = Paciente(id_paciente: 'id_paciente',
                               usuario: 'usuario', 
                               contrasena: 'contrasena',
                                primerNombre: 'primerNombre', 
                                segundoNombre: 'segundoNombre', 
                                primerApellido: 'primerApellido', 
                                segundoApellido: 'segundoApellido', 
                                genero: 'M', 
                                longitud: 'longitud', 
                                latitud: 'latitud');

  PacienteProvider() {
    print('PacientesProviders inicializado');
    this.getOnDisplayPaciente();
  }

  getOnDisplayPaciente() async {

    print('Hellooo Pacientes');

  }

   setPaciente(String correo) async {


    final paciente1 = await Paciente.fetchPaciente(correo);

    paciente.contrasena = paciente1.contrasena;
    paciente.primerNombre = paciente1.primerNombre;
    paciente.primerApellido = paciente1.primerApellido;
    paciente.genero = paciente1.genero;
    paciente.imagen = paciente1.imagen;
    paciente.segundoNombre = paciente1.segundoNombre;
    paciente.usuario = paciente1.usuario;
    paciente.id_paciente =paciente1.id_paciente;
    paciente.latitud = paciente1.latitud;
    paciente.longitud = paciente1.longitud;

    notifyListeners();

  }



}