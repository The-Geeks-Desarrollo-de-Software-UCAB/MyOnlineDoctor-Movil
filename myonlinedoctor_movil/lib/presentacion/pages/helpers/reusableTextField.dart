import 'package:flutter/material.dart';

import 'appcolors.dart';

TextField reusableTextField(String text, IconData icon, bool isPassWordType,
    TextEditingController controller) {
  return TextField(
      controller: controller,
      obscureText: isPassWordType,
      enableSuggestions: isPassWordType,
      autocorrect: isPassWordType,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(
            icon,
            color: AppColors.GREY,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.GREY),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.GREY),
              borderRadius: BorderRadius.circular(20)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.RED),
              borderRadius: BorderRadius.circular(20))),
      keyboardType: isPassWordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress);
}
