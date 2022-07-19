import 'package:myonlinedoctor_movil/dominio/doctor.dart';
import 'package:myonlinedoctor_movil/dominio/especialidades.dart';

class Cita{

  Cita({required this.doctor, required this.especialidad, required this.fecha});


  Doctor doctor;
  //Paciente paciente;
  Especialidades especialidad;
  DateTime fecha;




}