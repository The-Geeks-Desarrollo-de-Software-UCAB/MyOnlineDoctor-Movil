import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/aplicacion/registerFormThree.dart';
import 'package:myonlinedoctor_movil/dominio/cita.dart';
import 'package:myonlinedoctor_movil/dominio/doctor.dart';
import 'package:myonlinedoctor_movil/dominio/paciente.dart';
import 'package:myonlinedoctor_movil/locator.dart';

import 'package:myonlinedoctor_movil/presentacion/pages/detalles_doctor.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/doctores_page.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/homePageAgendada.dart';
import 'package:provider/provider.dart';

import 'aplicacion/registerFormTwo.dart';
import 'aplicacion/doctores_provider.dart';
import 'aplicacion/especialidades_provider.dart';
import 'aplicacion/paciente_provider.dart';
import 'dominio/especialidades.dart';
import 'presentacion/pages/loginPage.dart';
import 'presentacion/pages/ratingPage.dart';
import 'presentacion/pages/splashPage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => EspecialidadesProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => DoctoresProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => PacienteProvider(), lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: SplashPage(duration: 3, goToPage: LoginPage()),
      ),
    );
  }
}
