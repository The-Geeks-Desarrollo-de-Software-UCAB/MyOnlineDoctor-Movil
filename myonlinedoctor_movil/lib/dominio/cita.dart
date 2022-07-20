import 'dart:ffi';

import 'package:myonlinedoctor_movil/dominio/doctor.dart';
import 'package:myonlinedoctor_movil/dominio/especialidades.dart';

import 'paciente.dart';

class Cita{

  Cita({
  required this.doctor, 
  required this.especialidad, 
  required this.fecha, 
  required this.id_cita, 
  required this.duracion, 
  required this.tipoCita,
  required this.estadoCita,
  required this.motivo,
  required this.calificaion,
  required this.paciente
  });

  Int id_cita;
  DateTime fecha;
  Int duracion;
  String tipoCita;
  String estadoCita;
  String motivo;
  Int calificaion;
  Doctor doctor;
  Especialidades especialidad;
  Paciente paciente;




}