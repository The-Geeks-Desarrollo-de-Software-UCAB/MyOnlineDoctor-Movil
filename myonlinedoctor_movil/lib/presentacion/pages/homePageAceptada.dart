import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/dominio/paciente.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/citaAceptada.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/homePageAgendada.dart';
import 'package:provider/provider.dart';

import '../../aplicacion/paciente_provider.dart';
import '../../dominio/cita.dart';
import '../../infraestructura/controllers/getAppointments.dart';
import '../../infraestructura/moveAppointments.dart';
import 'doctores_page.dart';
import 'helpers/citaAgendada.dart';
import 'helpers/customtext.dart';
import 'historia_medica.dart';

class HomePageAceptada extends StatefulWidget {

  String email;
  HomePageAceptada({ required this.email, Key? key}) : super(key: key);

  @override
  State<HomePageAceptada> createState() => _HomePageAceptada();
}

class _HomePageAceptada extends State<HomePageAceptada> {
  //final GetAppoimentMock test = GetAppoimentMock();

  @override
  Widget build(BuildContext context) {
    final pacienteProvider = Provider.of<PacienteProvider>(context);
    pacienteProvider.setPaciente(widget.email);
   

    final paciente  = pacienteProvider.paciente;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.MAINCOLOR3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoriaMedica()))
              },
              child: Padding(
                padding: EdgeInsets.only(top: 9.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.receipt_long_sharp,
                      color: Colors.white,
                    ),
                    Text(
                      'Historia Médica',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20,),
            InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DoctoresPage()))
              },
              child: Padding(
                padding: EdgeInsets.only(top: 9.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Text(
                      'Buscar doctores',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 20,),
            InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage(email: widget.email,)))
              },
              child: Padding(
                padding: EdgeInsets.only(top: 9.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.access_time_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Citas Agendadas',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image:
                        NetworkImage('https://i.ibb.co/Y3ZfWSb/header2.png'))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              children: <Widget>[
                Container(
                  height: 80,
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://i.ibb.co/tQ5Q3SN/mujer17.jpg'),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              paciente.primerNombre + ' ' + paciente.primerApellido,
                              style: TextStyle(
                                  color: AppColors.WHITE,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Paciente',
                              style: TextStyle(
                                  color: AppColors.WHITE,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ])
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: FutureBuilder(
                        future: Cita.fetchCitas(paciente.id_paciente),
                        builder: (BuildContext context, snapshot) {
                          if(!snapshot.hasData){
                            return const Center(
                                child: Text('No hay citas Aceptadas'));
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            print(snapshot.data);
                            return listToDayAppoimentCard(
                                context, snapshot.data as List<Cita>, 60);
                          }
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget listToDayAppoimentCard(
    BuildContext context, List<Cita> citas, double width) {
  // ScheduledAppoiment storedAppoiment = ScheduledAppoiment();

  /* for (final value in citas) {
    scheduledAppoiments.add(value);
  }*/

  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: citas.length,
      itemBuilder: ((context, index) {
        return Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            child: CitaAceptadaCard(
              cita: citas[index],
              topColor: const Color(0xFF0FAB98),
            ));
      }));
}
