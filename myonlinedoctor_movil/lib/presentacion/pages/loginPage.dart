// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/doctores_page.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/botonReusable.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/reusableTextField.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/homePageAceptada.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/registerPage.dart';
import 'package:provider/provider.dart';

import '../../aplicacion/paciente_provider.dart';
import 'helpers/appcolors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool isAPIcallProcess = false;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final pacienteProvider = Provider.of<PacienteProvider>(context);
    pacienteProvider.setPaciente('pedrito@gmail.com');
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  logoDegradado(),
                  titulo(),
                  SizedBox(
                    height: 40,
                  ),
                  reusableTextField(
                      'Email', Icons.email, false, _emailTextController),
                  SizedBox(
                    height: 15,
                  ),
                  reusableTextField(
                      'Contraseña', Icons.lock, true, _passwordTextController),
                  SizedBox(
                    height: 50,
                  ),
                  botonReusable(context, true, () {


                      pacienteProvider.setPaciente(_emailTextController.text);
                      id_paciente = pacienteProvider.paciente.id_paciente;
                      nombre_paciente = pacienteProvider.paciente.primerNombre;
                      apellido_paciente = pacienteProvider.paciente.primerApellido;
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageAceptada(),
                          ));
                    }).onError((error, stackTrace) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error al ingresar'),
                          content: Text(
                              'Es posible que el correo o la contraseña estén incorrectos, o que no exista un paciente con el correo ingresado. Por favor verifique sus datos.'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: AppColors.MAINCOLOR3),
                                ))
                          ],
                        ),
                      );
                    });
                  }, _emailTextController.text),
                  SizedBox(
                    height: 18,
                  ),
                  signUpOption()
                ],
              ),
            )),
          )
        ],
      ),
    ));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿No tienes una cuenta?",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ));
          },
          child: const Text(" ¡Registrate!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        )
      ],
    );
  }
}

Widget logoDegradado() {
  return Image.network(
    'https://i.ibb.co/sRhR8SK/logo2.png',
    height: 150,
    width: 150,
  );
}

Widget titulo() {
  return Text(
    'My Online Doctor',
    textAlign: TextAlign.center,
    style: TextStyle(
        color: AppColors.MAINCOLOR3, fontSize: 30, fontWeight: FontWeight.bold),
  );
}
