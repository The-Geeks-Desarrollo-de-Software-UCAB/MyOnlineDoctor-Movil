// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_final_fields, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/aplicacion/registerFormTwo.dart';
//import 'package:flutter/src/foundation/key.dart';
import 'package:myonlinedoctor_movil/dominio/paciente.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/reusableTextField.dart';

class RegisterFormOne extends StatefulWidget {
  //Paciente paciente;
  RegisterFormOne({Key? key /*, required this.paciente*/}) : super(key: key);

  @override
  State<RegisterFormOne> createState() => _RegisterFormOneState();
}

class _RegisterFormOneState extends State<RegisterFormOne> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //RegisterService registerService = locator.get<RegisterService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    '¡Agradecemos tu interés en unirte a MyOnlineDoctor!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 37, 37, 37)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    'Para completar tu registro, por favor asegurate de llenar los siguientes datos',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 59, 59, 59)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Email:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 37, 37, 37)),
                ),
                TextFormField(
                  controller: _emailTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.GREY,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.GREY),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.GREY),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.RED),
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Por favor ingrese un correo";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_*-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value!)) {
                      return "Por favor ingrese un correo valido";
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Contraseña:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 37, 37, 37)),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _passwordTextController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Por favor introduzca una contraseña";
                    } else if (value!.length < 8) {
                      return "La contraseña debe tener al menos 8 caracteres";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.GREY,
                      ),
                      hintText: "Contraseña",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.GREY),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.GREY),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.RED),
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Confirmar contraseña:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 37, 37, 37)),
                ),
                TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _confirmPasswordTextController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColors.GREY,
                        ),
                        hintText: "Confirme su contraseña",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: AppColors.GREY),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: AppColors.GREY),
                            borderRadius: BorderRadius.circular(20)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: AppColors.RED),
                            borderRadius: BorderRadius.circular(20))),
                    /*      onChanged: (value) {
                        _confirmPassword = value;
                      },*/
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Es necesario que confirme su contraseña';
                      }
                      if (_passwordTextController.text !=
                          _confirmPasswordTextController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Número de teléfono:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 37, 37, 37)),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _phoneTextController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Por favor introduzca su número de teléfono";
                    } else if (value!.length != 11) {
                      return "Un número de teléfono válido debe tener al menos 11 caracteres.";
                    } else {
                      return null;
                    }
                  },
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: AppColors.GREY,
                      ),
                      hintText: "Contraseña",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.GREY),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.GREY),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.RED),
                          borderRadius: BorderRadius.circular(20))),
                ),
                //reusableTextField(
                //  'Contraseña', Icons.lock, true, _passwordTextController),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.MAINCOLOR3,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  child: Text('Siguiente'),
                  onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          print('exito');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterFormTwo(),
                              ));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        }),
                      }
                    else
                      {print("UnSuccessfull")}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
TextFormField campoRellenable(
    String text, bool esRequerido, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    autofocus: false,
    cursorColor: Colors.white,
    decoration: InputDecoration(
        hintText: text,
        labelText: text,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.GREY),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.GREY),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.RED),
            borderRadius: BorderRadius.circular(20))),
    validator: (value) {
      if (esRequerido == true) {
        if (value == null) return 'Campo requerido';
        if (value.length <= 1) return 'Campo requerido';
      }
    },
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );
}
*/