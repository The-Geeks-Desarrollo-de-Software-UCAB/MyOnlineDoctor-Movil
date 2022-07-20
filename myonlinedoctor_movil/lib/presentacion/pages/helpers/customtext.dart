import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomText({
    Key? key,
    required this.text,
    required this.size,
    this.color,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size ?? 16.0,
            color: color ?? Colors.black,
            fontWeight: weight ?? FontWeight.normal));
  }
}
