import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../succesfulRatingPage.dart';
import 'appcolors.dart';

class Rating extends StatefulWidget {
  Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _Rating();
}

class _Rating extends State<Rating> {
  double ratingValue = 0;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (rating) {
            isloading = true;
            ratingValue = rating;
            print(ratingValue);
            setState(() {});
          },
          starCount: 5,
          rating: ratingValue,
          size: 40.0,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half_outlined,
          color: Colors.cyan,
          borderColor: Colors.cyan,
          spacing: 0.0),
      SizedBox(
        height: 60,
      ),
      ElevatedButton(
        child: Text('Enviar'),
        onPressed: () => {
          print(ratingValue),
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuccesfulRatingPage()))
        },
        style: ElevatedButton.styleFrom(
            primary: AppColors.MAINCOLOR3,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      )
    ]);
  }
}
