
import 'dart:ffi';

import 'package:myonlinedoctor_movil/dominio/doctor.dart';
import 'package:myonlinedoctor_movil/dominio/especialidades.dart';

import 'paciente.dart';


import 'package:flutter/material.dart';

enum AppoimentState { CANCELADA, RECHAZADA, AGENDADA, SOLICITADA }
class Cita {
  final String id_cita;
  final Paciente paciente;
  final String motivo;
  AppoimentState state;
  DateTime? date;
  TimeOfDay? time;
  Doctor doctor;

  Cita(this.paciente, this.motivo, this.id_cita, this.state,this.doctor);
}

