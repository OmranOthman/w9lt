import 'package:flutter/material.dart';
import 'package:wslet/Core/const/app_colors.dart';


Widget textInputSignup({controller, hint, icon, keyboardType}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      color: AppColors.c3,
    ),
    padding: EdgeInsets.only(left: 10),
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "هذا الحقل فارغ";
        } else
          return null;
      },
      controller: controller,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.end,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: Icon(icon),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: AppColors.c3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: AppColors.c3)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.red)),
      ),
    ),
  );
}
