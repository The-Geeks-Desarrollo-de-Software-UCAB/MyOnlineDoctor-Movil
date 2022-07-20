import 'package:flutter/material.dart';

enum AppoimentState { CANCELADA, RECHAZADA, AGENDADA, SOLICITADA }

class Cita {
  final String id_cita;
  final String paciente;
  final String motivo;
  AppoimentState state;
  DateTime? date;
  TimeOfDay? time;

  Cita(this.paciente, this.motivo, this.id_cita, this.state);
}
