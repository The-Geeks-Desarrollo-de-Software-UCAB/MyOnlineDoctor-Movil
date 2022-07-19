import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/doctores_page.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/homePage.dart';

import 'presentacion/pages/loginPage.dart';
import 'presentacion/pages/ratingPage.dart';
import 'presentacion/pages/splashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SplashPage(duration: 3, goToPage: DoctoresPage()),
    );
  }
}
