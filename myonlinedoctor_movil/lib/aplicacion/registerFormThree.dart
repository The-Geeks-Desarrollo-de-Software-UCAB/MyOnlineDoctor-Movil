import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/SuccessRegisterPage.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';

class RegisterFormThree extends StatefulWidget {
  const RegisterFormThree({Key? key}) : super(key: key);

  @override
  State<RegisterFormThree> createState() => _RegisterFormThreeState();
}

class _RegisterFormThreeState extends State<RegisterFormThree> {
  TextEditingController _antecedentes = TextEditingController();
  TextEditingController _operaciones = TextEditingController();
  TextEditingController _alergias = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Datos médicos del paciente"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: <Color>[AppColors.MAINCOLOR1, AppColors.MAINCOLOR2])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Antecedentes:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 37, 37, 37)),
                  ),
                  TextFormField(
                    maxLines: null,
                    controller: _antecedentes,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Antecedentes",
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
                        return "Por favor ingrese antecedentes. En caso de no aplicar, ingrese N/A";
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Operaciones:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 37, 37, 37)),
                  ),
                  TextFormField(
                    maxLines: null,
                    controller: _operaciones,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Operaciones",
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
                        return "Por favor ingrese sus previas operaciones. En caso de no aplicar, ingrese N/A";
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Alergias:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 37, 37, 37)),
                  ),
                  TextFormField(
                    maxLines: null,
                    controller: _alergias,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Alergias",
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
                        return "Por favor ingrese alergias. En caso de no aplicar, ingrese N/A";
                      }
                    },
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.MAINCOLOR3,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      child: Text('Siguiente'),
                      onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {
                                print(_antecedentes.text),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SuccessRegisterPage(),
                                    ))
                              }
                          }),
                ],
              ))),
        ),
      ),
    );
  }
}
