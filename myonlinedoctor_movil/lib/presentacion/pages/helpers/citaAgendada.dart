import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/detallecita.dart';
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
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.WHITE,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    color: AppColors.GREY.withOpacity(.3),
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
                        text: "Doctor: ${cita.doctor}\n",
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
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.cyan),
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetalleCita(
                                              cita: cita,
                                            )))
                              },
                          child: const CustomText(
                              text: "Ver detalles",
                              color: Colors.white,
                              size: 12,
                              weight: FontWeight.bold)),
                    )),
                  ],
                )
              ],
            )));
  }
}
