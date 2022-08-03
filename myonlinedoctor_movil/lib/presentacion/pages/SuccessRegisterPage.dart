import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/loginPage.dart';

class SuccessRegisterPage extends StatefulWidget {
  const SuccessRegisterPage({Key? key}) : super(key: key);

  @override
  State<SuccessRegisterPage> createState() => _SuccessRegisterPageState();
}

class _SuccessRegisterPageState extends State<SuccessRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Resultado de registro"),
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
        body: Center(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  '¡Gracias por rellenar el formulario!',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 37, 37, 37)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.MAINCOLOR3,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  child: Text('Regresar al login'),
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ))
                      }),
            ],
          )),
        ));
  }
}
