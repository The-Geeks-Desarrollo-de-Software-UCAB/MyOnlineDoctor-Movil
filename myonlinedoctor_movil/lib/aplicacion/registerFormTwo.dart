import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterFormTwo extends StatefulWidget {
  const RegisterFormTwo({Key? key}) : super(key: key);

  @override
  State<RegisterFormTwo> createState() => _RegisterFormTwoState();
}

class _RegisterFormTwoState extends State<RegisterFormTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Datos validos')));
  }
}

TextEditingController _primerNombre = TextEditingController();
TextEditingController _segundoNombre = TextEditingController();
TextEditingController _primerApellido = TextEditingController();
TextEditingController _segundoApellido = TextEditingController();
String _genero = '';
/*import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController _altura = TextEditingController();
  TextEditingController _peso = TextEditingController();
  TextEditingController _antecedentes = TextEditingController();
  TextEditingController _operaciones = TextEditingController();
  TextEditingController _alergias = TextEditingController();

  //RegisterService registerService = locator.get<RegisterService>();

  @override
  Widget build(BuildContext context) {
    /* final pacienteForm = Provider.of<RegisterProvider>(context);
    pacienteForm.paciente = this.widget.paciente;*/
    final items = ['F', 'M'];
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
          child: Form(
        //key: registerForm.formKey,
        child: Column(
          children: [
            campoRellenable('Primer nombre', true, _primerNombre),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Segundo nombre', false, _segundoNombre),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Primer apellido', true, _primerApellido),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Segundo apellido', true, _segundoApellido),
            SizedBox(
              height: 15,
            ),
            // DropdownButton(items: items, onChanged: onChanged)
            SizedBox(
              height: 15,
            ),

          ],
        ),
      )),
    );
  }
}

 campoRellenable('Primer nombre', true, _primerNombre),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Segundo nombre', false, _segundoNombre),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Primer apellido', true, _primerApellido),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Segundo apellido', true, _segundoApellido),
            SizedBox(
              height: 15,
            ),
            // DropdownButton(items: items, onChanged: onChanged)
            SizedBox(
              height: 15,
            ),


            campoRellenable('Altura', true, _altura),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Peso', true, _peso),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Antecedentes', true, _antecedentes),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Operaciones', true, _operaciones),
            SizedBox(
              height: 15,
            ),
            campoRellenable('Alergias', true, _alergias),
            */