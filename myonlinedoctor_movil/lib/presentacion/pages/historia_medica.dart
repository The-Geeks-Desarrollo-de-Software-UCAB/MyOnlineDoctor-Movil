import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/aplicacion/trazabilidad/AnalyticsService.dart';
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/dominio/registro_medico.dart';
import 'package:myonlinedoctor_movil/locator.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/lista_registros.dart';
import 'package:provider/provider.dart';

import '../../aplicacion/listadoctores.dart';
import '../../aplicacion/paciente_provider.dart';
import '../../aplicacion/search_delegate.dart';
import '../../dominio/doctor.dart';
import '../../dominio/especialidades.dart';
import 'helpers/appcolors.dart';
import 'homePageAgendada.dart';

class HistoriaMedica extends StatefulWidget {
  const HistoriaMedica({Key? key}) : super(key: key);

  @override
  State<HistoriaMedica> createState() => _HistoriaMedica();
}

class _HistoriaMedica extends State<HistoriaMedica> {
 
  final AnalyticsService analyticsService = locator.get<AnalyticsService>();
  @override
  Widget build(BuildContext context) {

     final pacienteProvider = Provider.of<PacienteProvider>(context);

    return Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          color: AppColors.MAINCOLOR3,
          child: InkWell(
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage(email: pacienteProvider.paciente.usuario)))
            },
            child: Padding(
              padding: EdgeInsets.only(top: 9.0),
              child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.house,
                    color: Colors.white,
                  ),
                  Text(
                    'Inicio',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
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
          title: const Text(
            'HistoriaMedica',
            style: TextStyle(color: AppColors.WHITE),
          ),

          leading:IconButton(
              onPressed:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage(email: pacienteProvider.paciente.usuario)));
              }, 
              icon:Icon(Icons.arrow_back)) ,
        ),
        body: 
         FutureBuilder(
            future: RegistroMedico.fetchRegistros(
                id_paciente),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListaRegistros([RegistroMedico( DateTime.now(), 
                                                      Doctor(
                                                              id: '2',
                                                              nombre: 'Carla',
                                                              apellido: 'Cepeda',
                                                              genero: 'F',
                                                              imagen: 'https://i.ibb.co/fN9c7QF/mujer11.jpg',
                                                              especialidades: [
                                                                Especialidades(id: 1, nombre: 'Cardiologia'),
                                                                Especialidades(id: 2, nombre: 'Traumatologia')
                                                              ],
                                                              calificaciones: 3.0), 
                                                    'Se recibe paciente que refiere fiebre, tos y dolor de Garganta', 
                                                    'Se presume de Covid-19', 
                                                    'Guardar reposo por 3 días y hacer gargaras de sal', 
                                                    ['PCR', 'Hematología Completa'], 
                                                    'Atamel Forte cada 8 horas')]);
                //return Center(child: CircularProgressIndicator());
              } else {
                return ListaRegistros(snapshot.data);
              }

             }
           )
        );
  }
}
