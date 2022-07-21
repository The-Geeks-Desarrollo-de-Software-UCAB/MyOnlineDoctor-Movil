import 'package:flutter/material.dart';

import '../dominio/cita.dart';
import '../dominio/doctor.dart';
import '../dominio/especialidades.dart';

import '../data.dart';
import 'package:http/http.dart' as http;

class SolicitudCitaProvider extends ChangeNotifier {

  GlobalKey<FormState>  formKey = new GlobalKey<FormState>();

  Doctor? doctor;
  Especialidades? especialidad;
  int pacienteID =0;
  


  bool _isloading = false;

  bool get isloading => _isloading;

  set isloading (bool value){
    _isloading = value;
    notifyListeners();
  }

  bool esSolicitudValida(){

    print(this.doctor!.nombre);
    print(formKey.currentState?.validate() ?? false);

    return formKey.currentState?.validate() ?? false;

  }

  getcitasDoctor() async {


    final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/doctorSpecialty/all'));
    //final citasresponse = Cita.fromJson(response.body);

    //print(citasresponse.doctor.apellido);



  }



}

