// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_final_fields, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctor_movil/aplicacion/registerFormThree.dart';
import '../presentacion/pages/helpers/appcolors.dart';

class RegisterFormTwo extends StatefulWidget {
  const RegisterFormTwo({Key? key}) : super(key: key);

  @override
  State<RegisterFormTwo> createState() => _RegisterFormTwoState();
}

class _RegisterFormTwoState extends State<RegisterFormTwo> {
  TextEditingController _primerNombre = TextEditingController();
  TextEditingController _segundoNombre = TextEditingController();
  TextEditingController _primerApellido = TextEditingController();
  TextEditingController _segundoApellido = TextEditingController();
  String _genero = '';
  String dropDownValue = 'Seleccione';
  var items = ['F', 'M'];
  DateTime? _birthDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Primer Nombre:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 37, 37, 37)),
                        ),
                        TextFormField(
                          controller: _primerNombre,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Primer nombre",
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.RED),
                                  borderRadius: BorderRadius.circular(20))),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Por favor ingrese su nombre";
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Segundo Nombre:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 37, 37, 37)),
                        ),
                        TextFormField(
                          controller: _segundoNombre,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Segundo nombre",
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.RED),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Primer Apellido:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 37, 37, 37)),
                        ),
                        TextFormField(
                          controller: _primerApellido,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Primer apellido",
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.RED),
                                  borderRadius: BorderRadius.circular(20))),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Por favor ingrese su apellido";
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Segundo Apellido:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 37, 37, 37)),
                        ),
                        TextFormField(
                          controller: _segundoApellido,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Segundo apellido",
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.GREY),
                                  borderRadius: BorderRadius.circular(20)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.RED),
                                  borderRadius: BorderRadius.circular(20))),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Por favor ingrese su segundo apellido";
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Genero:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 37, 37, 37)),
                        ),
                        DropdownButton<String>(
                          value: dropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          underline: Container(
                            height: 2,
                            color: AppColors.GREY,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                              _genero = newValue;
                            });
                          },
                          items: <String>['Seleccione', 'Femenino', 'Masculino']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        /*SizedBox(
                  height: 15,
                ),
                FormField<DateTime>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: _birthDate,
                  validator: (value) {
                    if (value == null) {
                      return "Por favor ingrese su fecha de nacimiento";
                    }
                    if (!value.isBefore(DateTime(now.year, now.month, now.day)))){

                    }
                  },
                ),*/
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
                                      print(_genero),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterFormThree(),
                                          ))
                                    }
                                }),
                      ],
                    ),
                  ))),
        ));
  }
}
/*
List<DropdownMenuItem<String>> get dropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Femenino"), value: "F"),
    DropdownMenuItem(child: Text("Masculino"), value: "M"),
  ];
  return menuItems;
}
*/