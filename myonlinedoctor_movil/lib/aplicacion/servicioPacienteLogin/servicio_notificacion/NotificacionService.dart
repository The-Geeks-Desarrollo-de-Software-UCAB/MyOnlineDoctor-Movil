import 'package:http/http.dart' as http;
import 'package:myonlinedoctor_movil/aplicacion/videollamada/utils/settings.dart';

class NotificacionService {
  guardarDispositivo(String id_paciente, String token) async {
    return await http.post(
        Uri.parse(
            "https://myonlinedoctorapi.herokuapp.com/api/notificacion/dispositivo"),
        body: {"id_paciente": id_paciente, "token": token});
  }
}
