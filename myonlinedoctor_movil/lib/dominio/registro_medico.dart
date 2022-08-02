import 'dart:ffi';

import 'package:myonlinedoctor_movil/dominio/doctor.dart';

class RegistroMedico {


  RegistroMedico(this.motivo, this.fecha, this.doctor, this.historia, this.diagnostico, this.plan, this.examenes, this.prescripcion);
  

  String motivo;
  DateTime fecha;
  Doctor doctor;
  String historia;
  String diagnostico;
  String plan;
  List<String> examenes;
  String prescripcion;

  
}