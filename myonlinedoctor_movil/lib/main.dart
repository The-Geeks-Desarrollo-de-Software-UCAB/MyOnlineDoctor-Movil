import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/locator.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/doctores_page.dart';

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
      home: Scaffold(
        body: Center(child: DoctoresPage()),
      ),
    );
  }
}
