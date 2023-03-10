// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constants/colors_constant.dart';
import '../../constants/text_constanst.dart';
import '../../utills/button.dart';
import '../../utills/text_styles.dart';

class PrivacyPolocy extends StatefulWidget {
  const PrivacyPolocy({super.key});

  @override
  State<PrivacyPolocy> createState() => _PrivacyPolocyState();
}

class _PrivacyPolocyState extends State<PrivacyPolocy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: back_icon(),
          centerTitle: true,
          title: custom_text(
              text: privacy_polcy,
              style: CustomStyle().style_18_medium(white))),
      body: WebView(
        initialUrl: "https://pub.dev/packages/webview_flutter",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
