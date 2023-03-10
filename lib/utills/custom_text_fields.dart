

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:returno/utills/text_styles.dart';
import '../constants/colors_constant.dart';
import '../constants/media_quiery.dart';




Widget custom_textformfield(
    {String? hintText,
    Widget? suffixIcon,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool obscureText = false}) {
  return TextFormField(
    cursorHeight: h * 0.03,
    cursorWidth: w * 0.00277,
    cursorColor: white70,
    controller: controller,
    style: CustomStyle().style_16_reguler(white70),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        fillColor: black70,
        filled: true,
        hintText: hintText,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: suffixIcon,
        ),
        hintStyle: CustomStyle().style_16_reguler(black50),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black70),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black70),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black70),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black70),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black70),
          borderRadius: BorderRadius.circular(8),
        )),
    validator: validator,
    obscureText: obscureText,
  );
}
