import 'package:flutter/material.dart';

import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';

class Tourial extends StatefulWidget {
  const Tourial({super.key});

  @override
  State<Tourial> createState() => _TourialState();
}

class _TourialState extends State<Tourial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(tourialbackground), fit: BoxFit.cover)),
              
    );
  }
}
