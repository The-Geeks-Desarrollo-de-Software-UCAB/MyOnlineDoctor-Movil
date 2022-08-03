import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctor_movil/aplicacion/registerFormOne.dart';
import 'package:myonlinedoctor_movil/dominio/paciente.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/reusableTextField.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Paciente paciente;
    /*   TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _firstNameTextController = TextEditingController();
    TextEditingController _secondNameTextController = TextEditingController();
    TextEditingController _firstLastNameTextController = TextEditingController();
    TextEditingController _secondLastNameTextController = TextEditingController();
    TextEditingController _genderTextController = TextEditingController();*/
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Registro de paciente"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                  AppColors.MAINCOLOR1,
                  AppColors.MAINCOLOR2
                ])),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //  ChangeNotifierProvider(
              //  create: (_) => RegisterProvider(),
              // child: RegisterForm(paciente: paciente),
              //),
              RegisterFormOne()
            ],
          ),
        ));
  }
}
