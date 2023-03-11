// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants/image_constants.dart';
import '../constants/media_quiery.dart';
import '../navigation_services/navigator_key.dart';

Widget custom_button(
    {double? width,
    Function()? onTap,
    List<Widget>? children,
    List<Color>? colors}) {
  return InkWell(
    onTap: onTap,
    child: Container(
        height: h * 0.065,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors!,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center, children: children!)),
  );
}

// arrow back button
back_icon() {
  return GestureDetector(
    onTap: () {
      Navigator.pop(Navigation_services.navigatorkey.currentContext!);
    },
    child: Padding(
      padding: EdgeInsets.only(
          left: w * 0.04986, top: h * 0.01625, bottom: h * 0.01625),
      child: Image.asset(arrow_back_icon),
    ),
  );
}
