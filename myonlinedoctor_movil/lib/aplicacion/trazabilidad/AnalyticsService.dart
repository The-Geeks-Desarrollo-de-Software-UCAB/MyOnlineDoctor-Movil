import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:myonlinedoctor_movil/aplicacion/trazabilidad/ITrazabilidadService.dart';

class AnalyticsService extends TrazabilidadService {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer() =>
      FirebaseAnalyticsObserver(analytics: analytics);

  Future setUserProperties(String userId) async {
    await analytics.setUserId();
  }

  Future logLogin() async {
    await analytics.logLogin(loginMethod: "email");
  }

  Future logBusqueda(String busqueda) async {
    await analytics.logSearch(searchTerm: busqueda);
  }

  Future logSolicitudCita() async {
    await analytics.logEvent(name: 'solicitar_Cita');
  }

  Future iniciarVideollamada() async {
    await analytics.logEvent(name: "iniciar_Videollamada");
  }

  Future finalizarVideollamada() async {
    await analytics.logEvent(name: "finalizar_Videollamada");
  }

  Future busquedaEspecialidad(String especialidad) async {
    await analytics.logEvent(
        name: "Busco_Especialidad", parameters: {'especialidad': especialidad});
  }

  Future abrirDoctor() async {
    await analytics.logEvent(name: "abrir_doctor");
  }
}
