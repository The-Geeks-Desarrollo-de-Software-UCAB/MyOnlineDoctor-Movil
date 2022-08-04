import 'package:get_it/get_it.dart';
import 'package:myonlinedoctor_movil/aplicacion/servicioPacienteLogin/servicio_notificacion/NotificacionService.dart';
import 'package:myonlinedoctor_movil/aplicacion/servicio_cita/CitaService.dart';
import 'package:myonlinedoctor_movil/aplicacion/trazabilidad/AnalyticsService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AnalyticsService());
  locator.registerLazySingleton(() => CitaService());
  locator.registerLazySingleton(() => NotificacionService());
}
