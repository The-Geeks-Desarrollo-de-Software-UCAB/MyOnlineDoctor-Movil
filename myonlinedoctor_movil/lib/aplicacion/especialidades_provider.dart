

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    
  }


}