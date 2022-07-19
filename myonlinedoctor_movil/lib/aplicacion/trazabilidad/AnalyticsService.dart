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

  Future logSolictudCita() async {
    await analytics.logEvent(name: 'Solicitar Cita');
  }

  Future iniciarVideollamada() async {
    await analytics.logEvent(name: "Iniciar Videollamada");
  }
}
