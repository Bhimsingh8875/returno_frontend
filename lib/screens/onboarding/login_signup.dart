// ignore_for_file: must_be_immutable, prefer_const_constructors, unused_element, unused_field, camel_case_types, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:returno/constants/text_constanst.dart';
import 'package:returno/screens/homepage.dart';
import 'package:returno/screens/onboarding/forgot_Password.dart';
import 'package:returno/utills/text_styles.dart';
import '../../constants/colors_constant.dart';
import '../../constants/media_quiery.dart';
import '../../utills/button.dart';
import '../../utills/custom_text_fields.dart';
import '../../utills/email_validation.dart';
import '../../utills/navigation_rougth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visibility = false;
  bool visibility1 = false;

  final GlobalKey<FormState> login_key = GlobalKey<FormState>();
  final GlobalKey<FormState> signup_key = GlobalKey<FormState>();
  TextEditingController login_emailcontroller = TextEditingController();
  TextEditingController login_passwordcontroller = TextEditingController();
  TextEditingController signup_emailcontroller = TextEditingController();
  TextEditingController signup_passwordcontroller = TextEditingController();
  bool current_page = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundclr,
        body: Padding(
          padding: EdgeInsets.only(left: w * 0.04155, right: w * 0.04155),
          child: ListView(
            children: [
              current_page
                  ? Form(
                      key: login_key,
                      child: Column(children: [
                        SizedBox(height: h * 0.125),
                        custom_text_with_center(
                            text: welcome,
                            style: CustomStyle().style_22_medium(white)),
                        SizedBox(height: h * 0.01),
                        custom_text_with_center(
                            text: suggestion_login,
                            style: CustomStyle().style_16_reguler(black50)),
                        SizedBox(height: h * 0.075),
                        custom_textformfield(
                          hintText: email,
                          suffixIcon: Icon(
                            Icons.clear,
                            color: Colors.transparent,
                          ),
                          controller: login_emailcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            } else if (!emailPattern.hasMatch(
                                login_emailcontroller.text.toString())) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: h * 0.0225),
                        custom_textformfield(
                          hintText: password,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            child: Icon(
                              visibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: black50,
                            ),
                          ),
                          controller: login_passwordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 8) {
                              return 'Please enter minimun 8 characters';
                            }
                            return null;
                          },
                          obscureText: !visibility,
                        ),
                        SizedBox(height: h * 0.0125),
                        Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () {
                                  push_to(context, Forgot_Password());
                                },
                                child: custom_text(
                                    text: forgot,
                                    style: CustomStyle()
                                        .style_15_reguler(black50)))),
                        SizedBox(height: h * 0.0475),
                        custom_button(
                            onTap: () {
                              if (login_key.currentState!.validate()) {
                                push_to(context, Homepage());
                              }
                            },
                            children: [
                              custom_text(
                                  text: login,
                                  style: CustomStyle().style_18_reguler(white)),
                            ],
                            colors: [
                              buttonclr1,
                              buttonclr2
                            ]),
                        SizedBox(height: h * 0.0225),
                        custom_button(onTap: () {}, children: [
                          custom_text(
                              text: continue_as_guest,
                              style: CustomStyle().style_18_reguler(blue)),
                        ], colors: [
                          white,
                          white
                        ]),
                        SizedBox(height: h * 0.0475),
                      ]),
                    )
                  : Form(
                      key: signup_key,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: h * 0.125),
                            custom_text_with_center(
                                text: create_account,
                                style: CustomStyle().style_22_medium(white)),
                            SizedBox(height: h * 0.01),
                            custom_text_with_center(
                                text: suggestion_sign,
                                style: CustomStyle().style_16_reguler(black50)),
                            SizedBox(height: h * 0.075),
                            custom_textformfield(
                              hintText: email,
                              suffixIcon: Icon(
                                Icons.clear,
                                color: Colors.transparent,
                              ),
                              controller: signup_emailcontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email';
                                } else if (!emailPattern.hasMatch(
                                    signup_emailcontroller.text.toString())) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: h * 0.0225),
                            custom_textformfield(
                              hintText: password,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    visibility1 = !visibility1;
                                  });
                                },
                                child: Icon(
                                  visibility1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: black50,
                                ),
                              ),
                              controller: signup_passwordcontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else if (value.length < 8) {
                                  return 'Please enter minimun 8 characters';
                                }
                                return null;
                              },
                              obscureText: !visibility1,
                            ),
                            SizedBox(height: h * 0.0475),
                            custom_button(
                                onTap: () {
                                  if (signup_key.currentState!.validate()) {
                                    push_to(context, Homepage());
                                  }
                                },
                                children: [
                                  custom_text(
                                      text: sign_up,
                                      style: CustomStyle()
                                          .style_18_reguler(white)),
                                ],
                                colors: [
                                  buttonclr1,
                                  buttonclr2
                                ]),
                            SizedBox(height: h * 0.0225),
                            custom_button(onTap: () {}, children: [
                              custom_text(
                                  text: continue_as_guest,
                                  style: CustomStyle().style_18_reguler(blue)),
                            ], colors: [
                              white,
                              white
                            ]),
                            SizedBox(height: h * 0.0475),
                          ]),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  custom_text(
                      text: current_page ? account : already,
                      style: CustomStyle().style_16_reguler(white70)),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: (() {
                      setState(() {
                        current_page = !current_page;
                      });
                    }),
                    child: custom_text(
                        text: current_page ? sign_up : login,
                        style: CustomStyle().style_16_reguler(blue)),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
