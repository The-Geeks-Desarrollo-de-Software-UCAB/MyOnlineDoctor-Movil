// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';

import 'helpers/appcolors.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                AppColors.MAINCOLOR1,
                AppColors.MAINCOLOR2,
              ],
            )),
            child: Center(
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: NetworkImage('https://i.ibb.co/By28LX8/logo.png'),
                image: NetworkImage('https://i.ibb.co/By28LX8/logo.png'),
                height: 180,
                width: 180,
              ),
            )));
  }
}
