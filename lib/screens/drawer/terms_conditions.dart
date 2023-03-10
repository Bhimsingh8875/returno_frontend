// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constants/colors_constant.dart';
import '../../constants/text_constanst.dart';
import '../../utills/button.dart';
import '../../utills/text_styles.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: back_icon(),
          centerTitle: true,
          title: custom_text(
              text: terms_and_conditions,
              style: CustomStyle().style_18_medium(white))),
      body: WebView(
        initialUrl: "https://flutter.dev/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
