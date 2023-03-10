// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:returno/utills/button.dart';
import 'package:returno/utills/text_styles.dart';
import '../constants/colors_constant.dart';
import '../constants/media_quiery.dart';
import '../constants/text_constanst.dart';
import '../navigation_services/navigator_key.dart';

logout_dialog({String? text}) {
  Navigation_services.navigatorkey.currentContext!.showFlashDialog(
      transitionDuration: Duration(milliseconds: 500),
      constraints: BoxConstraints(maxWidth: 300),
      persistent: true,
      margin: EdgeInsets.zero,
      content: custom_text_with_center(
          text: text, style: CustomStyle().style_16_reguler(black)),
      negativeActionBuilder: (context, controller, _) {
        return Padding(
          padding: const EdgeInsets.only(right: 30),
          child: TextButton(
              onPressed: () {
                controller.dismiss();
              },
              child: custom_text(
                  text: cancel, style: CustomStyle().style_16_reguler(blue))),
        );
      },
      positiveActionBuilder: (context, controller, _) {
        return SizedBox(
          height: h * 0.05,
          child: custom_button(
              width: w * 0.35,
              onTap: () {
                controller.dismiss();
              },
              children: [
                custom_text(
                    text: logout, style: CustomStyle().style_16_reguler(white))
              ],
              colors: [
                buttonclr1,
                buttonclr2
              ]),
        );
      });
}
