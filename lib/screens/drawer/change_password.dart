// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:returno/constants/media_quiery.dart';
import 'package:returno/utills/text_styles.dart';
import '../../constants/colors_constant.dart';
import '../../constants/text_constanst.dart';
import '../../utills/button.dart';
import '../../utills/custom_text_fields.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var password_controller = TextEditingController();
  var new_password_controller = TextEditingController();
  var confirm_password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundclr,
      appBar: AppBar(
          centerTitle: true,
          leading: back_icon(),
          title: custom_text(
              text: change_password,
              style: CustomStyle().style_18_medium(white))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 12),
                child: custom_text(
                    text: current_password,
                    style: CustomStyle().style_16_medium(white)),
              ),
              custom_textformfield(
                hintText: current_password,
                suffixIcon: Icon(
                  Icons.clear,
                  color: Colors.transparent,
                ),
                controller: password_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter current password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 12),
                child: custom_text(
                    text: new_password,
                    style: CustomStyle().style_16_medium(white)),
              ),
              custom_textformfield(
                hintText: new_password,
                suffixIcon: Icon(
                  Icons.clear,
                  color: Colors.transparent,
                ),
                controller: new_password_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter new password';
                  } else if (value.length < 8) {
                    return 'Please enter minimum 8 charactors of password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 12),
                child: custom_text(
                    text: confirm_password,
                    style: CustomStyle().style_16_medium(white)),
              ),
              custom_textformfield(
                hintText: confirm_password,
                suffixIcon: Icon(
                  Icons.clear,
                  color: Colors.transparent,
                ),
                controller: confirm_password_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter confirm password';
                  } else if (confirm_password_controller.text !=
                      new_password_controller.text) {
                    return 'Confirm password do`es not match!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              custom_button(
                  width: w * 1,
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  children: [
                    custom_text(
                        text: submit,
                        style: CustomStyle().style_18_reguler(white))
                  ],
                  colors: [
                    buttonclr1,
                    buttonclr2
                  ])
            ]),
          ),
        ),
      ),
    );
  }
}
