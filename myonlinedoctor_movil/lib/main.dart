import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/locator.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/doctores_page.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/homePage.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
<<<<<<< HEAD
      home: SplashPage(duration: 3, goToPage: HomePage()),
=======

      home: SplashPage(duration: 3, goToPage: HomePage()),


      //home: SplashPage(duration: 3, goToPage: DoctoresPage()),

>>>>>>> b7bb0ae3d7700f91363858beb3ea012ab00f3c9d
    );
  }
}
