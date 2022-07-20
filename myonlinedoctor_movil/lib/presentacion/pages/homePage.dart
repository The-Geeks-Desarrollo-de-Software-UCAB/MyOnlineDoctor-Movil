// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/citaAgendada.dart';

import '../../dominio/cita.dart';
import '../../infraestructura/controllers/getAppointments.dart';
import '../../infraestructura/moveAppointments.dart';
import 'helpers/customtext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GetAppoimentMock test = GetAppoimentMock();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                              'Lucia de Arias',
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
                Expanded(
                    child: FutureBuilder(
                        future: test.getAppoiment(),
                        builder: (BuildContext context, snapshot) {
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
