import 'package:get_it/get_it.dart';
import 'package:myonlinedoctor_movil/aplicacion/trazabilidad/AnalyticsService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AnalyticsService());
}
