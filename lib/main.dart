// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:returno/constants/colors_constant.dart';
import 'package:returno/navigation_services/navigator_key.dart';
import 'package:returno/screens/drawer/drawer_main_page.dart';
import 'package:returno/screens/homepage.dart';
import 'package:returno/screens/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Returno',
      navigatorKey: Navigation_services.navigatorkey,
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
