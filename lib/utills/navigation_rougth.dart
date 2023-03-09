// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:returno/navigation_services/navigator_key.dart';

class NavigatorRought {
  static push_to(Widget name) {
    Navigator.push(Navigation_services.navigatorkey.currentContext!,
        MaterialPageRoute(builder: (context) => name));
  }

  static replaceRoute(Widget name) {
    Navigator.pushReplacement(Navigation_services.navigatorkey.currentContext!,
        MaterialPageRoute(builder: (context) => name));
  }

  static pushAndRevoveUntil(Widget name) {
    Navigator.of(Navigation_services.navigatorkey.currentContext!)
        .pushAndRemoveUntil(MaterialPageRoute(builder: ((context) => name)), (route) => false);
  }
}
