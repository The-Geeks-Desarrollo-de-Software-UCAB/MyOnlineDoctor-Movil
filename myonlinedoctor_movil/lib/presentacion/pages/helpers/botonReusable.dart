import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';
import 'package:provider/provider.dart';

import '../../../aplicacion/paciente_provider.dart';

Widget botonReusable(BuildContext context, bool isLogin, Function onTap, String email) {


  return ElevatedButton(
    child: Text(isLogin ? 'ENTRAR' : 'REGISTRATE'),
    onPressed: () => {
      onTap()
      /*  Navigator.push(
          context, MaterialPageRoute(builder: (context) => DoctoresPage()))*/
    },
    style: ElevatedButton.styleFrom(
        primary: AppColors.MAINCOLOR3,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );
}
