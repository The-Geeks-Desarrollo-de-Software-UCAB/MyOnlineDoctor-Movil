import 'package:myonlinedoctor_movil/dominio/cita.dart';
import 'package:uuid/uuid.dart';

import 'dominio/paciente.dart';

String id_doctor = "088e361d-3ddf-46f4-8059-3406e189e2a9";
String id_doctor2 = '1cffbf21-857b-4d09-bded-29537338c6f7';
String id_paciente = "e49421aa-6508-4902-aec2-75d519299bb5";

String nombre_paciente = '';
String apellido_paciente = '';

//COLOQUEN SU IP PARA HACER LOS REQUEST
String ip = "";

class SetValores {
  static SetValoresPaciente(String email) async {
    Paciente paciente = await Paciente.fetchPaciente(email);

    nombre_paciente = paciente.primerNombre;
    apellido_paciente = paciente.primerApellido;
    id_paciente = paciente.id_paciente;
  }
}
