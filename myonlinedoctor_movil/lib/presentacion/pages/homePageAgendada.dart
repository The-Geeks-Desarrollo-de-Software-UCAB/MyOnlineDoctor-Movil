// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/data.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/citaAgendada.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/loginPage.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/citaAceptada.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/historia_medica.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/homePageAceptada.dart';
import 'package:provider/provider.dart';

import '../../aplicacion/paciente_provider.dart';
import '../../dominio/cita.dart';
import '../../infraestructura/controllers/getAppointments.dart';
import '../../infraestructura/moveAppointments.dart';
import 'doctores_page.dart';
import 'helpers/citaAgendada.dart';
import 'helpers/customtext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  //final GetAppoimentMock test = GetAppoimentMock();

  @override
  Widget build(BuildContext context) {

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
            SizedBox(
              width: 20,
            ),
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
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageAceptada()))
              },
              child: Padding(
                padding: EdgeInsets.only(top: 9.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      'Citas Aceptadas',
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
                            'https://licania.org/img/perfiles/Otro.png'),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nombre_paciente +
                                  ' ' +
                                  apellido_paciente,
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
                          ]),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: IconButton(
                            icon: Icon(Icons.logout),
                            color: Colors.white,
                            hoverColor: AppColors.BLACK,
                            onPressed: () {
                              FirebaseAuth.instance.signOut().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              });
                            }),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: FutureBuilder(
                        future: Cita.fetchCitasAgendadas(id_paciente),
                        builder: (BuildContext context, snapshot) {

                          if(!snapshot.hasData){
                            return const Center(
                                child: Text('No hay citas Agendadas'));
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
            child: CitaAgendadaCard(
              cita: citas[index],
              topColor: const Color(0xFF0FAB98),
            ));
      }));
}
