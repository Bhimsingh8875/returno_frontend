// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:returno/utills/text_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constants/colors_constant.dart';
import '../../constants/text_constanst.dart';
import '../../utills/button.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: back_icon(),
          centerTitle: true,
          title: custom_text(
              text: about_app, style: CustomStyle().style_18_medium(white))),
      body: WebView(
        initialUrl: "https://pub.dev/packages/webview_flutter",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
