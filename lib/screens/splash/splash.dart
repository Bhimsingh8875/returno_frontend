// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:returno/constants/colors_constant.dart';
import '../../constants/image_constants.dart';
import '../../constants/media_quiery.dart';
import '../../utills/navigation_rougth.dart';
import '../onboarding/tutorial.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @mustCallSuper
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      push_to(context, Tourial());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: h * 0.0575),
      child: Center(
        child: SvgPicture.asset(
          splashlogo,
        ),
      ),
    );
  }
}
