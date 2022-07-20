import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/loginPage.dart';

import '../../../dominio/cita.dart';
import '../doctores_page.dart';
import 'customtext.dart';

class CitaAgendadaCard extends StatelessWidget {
  final Cita cita;
  final Color? topColor;
  final bool? isActive;
  final void Function()? onTap;

  const CitaAgendadaCard(
      {Key? key, required this.cita, this.topColor, this.isActive, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: onTap,
            child: Container(
                height: 170,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.WHITE,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: AppColors.GREY.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: topColor ?? AppColors.MAINCOLOR3,
                          height: 5,
                        ))
                      ],
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.only(bottom: 30),
                    )),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Cita: ${cita.id_cita}\n",
                            style: TextStyle(
                              fontSize: 16,
                              color: isActive ?? false
                                  ? AppColors.MAINCOLOR3
                                  : AppColors.MAINCOLOR3,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: "Paciente: ${cita.paciente}\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: isActive ?? false
                                    ? AppColors.MAINCOLOR3
                                    : AppColors.MAINCOLOR3,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "Motivo Cita: ${cita.motivo}\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: isActive ?? false
                                    ? AppColors.MAINCOLOR3
                                    : AppColors.MAINCOLOR3,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "Fecha: 14/9/22\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: isActive ?? false
                                    ? AppColors.MAINCOLOR3
                                    : AppColors.MAINCOLOR3,
                                fontWeight: FontWeight.bold))
                      ]),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen),
                              onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DoctoresPage()))
                                  },
                              child: const CustomText(
                                  text: "Llamar",
                                  color: Colors.white,
                                  size: 12,
                                  weight: FontWeight.bold)),
                        )),
                      ],
                    )
                  ],
                ))));
  }
}
