// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
                            )
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
