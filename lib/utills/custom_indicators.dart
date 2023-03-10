

// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import '../constants/media_quiery.dart';

custom_circleAvatar({Color? backgroundColor}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: w * 0.01385),
    child: CircleAvatar(radius: h * 0.00625, backgroundColor: backgroundColor),
  );
}