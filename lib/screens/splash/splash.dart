import 'package:flutter/material.dart';
import 'package:returno/constants/text_constanst.dart';
import 'package:returno/utills/custom_buttons.dart';
import 'package:returno/utills/navigation_rougth.dart';

class Splash extends StatefulWidget {

  const Splash({ super.key });

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
  void initState() {
// Future.delayed(Duration(milliseconds: 1200),()=>NavigatorRought.push_to(login()));
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: custom_button(text: "")
       );
  }
}