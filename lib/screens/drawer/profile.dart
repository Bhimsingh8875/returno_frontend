// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, avoid_init_to_null, unused_element, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';
import '../../constants/media_quiery.dart';
import '../../constants/text_constanst.dart';
import '../../utills/button.dart';
import '../../utills/custom_text_fields.dart';
import '../../utills/text_styles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var name_controller = TextEditingController();
  var last_name_controller = TextEditingController();
  var gmail_controller = TextEditingController();
  var mobile_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundclr,
      appBar: AppBar(
          centerTitle: true,
          leading: back_icon(),
          title: custom_text(
              text: profile, style: CustomStyle().style_18_medium(white))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04155),
          child: Form(
            key: _formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Stack(
                      children: [
                        CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blue,
                            child: ImageFile == null
                                ? CircleAvatar(
                                    radius: 49,
                                    backgroundImage: AssetImage(profile_image),
                                  )
                                : CircleAvatar(
                                    radius: 49,
                                    backgroundImage:
                                        Image.file(File(ImageFile!.path)).image,
                                  )),
                        GestureDetector(
                          onTap: () {
                            _openGallery(context);
                          },
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child:
                                  Image.asset(edit_icon, height: h * 0.0375)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.0831),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_text(
                          text: "Manraj Saini",
                          style: CustomStyle().style_18_medium(white)),
                      SizedBox(height: h * 0.01),
                      custom_text(
                          text: "manrajsaini@gmail.com",
                          style: CustomStyle().style_15_reguler(black50)),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.0375, bottom: h * 0.015),
                child: custom_text(
                    text: first_name,
                    style: CustomStyle().style_16_medium(white)),
              ),
              custom_textformfield(
                hintText: first_name,
                suffixIcon: Icon(
                  Icons.clear,
                  color: Colors.transparent,
                ),
                controller: name_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.025, bottom: h * 0.015),
                child: custom_text(
                    text: last_name,
                    style: CustomStyle().style_16_medium(white)),
              ),
              custom_textformfield(
                hintText: last_name,
                suffixIcon: Icon(
                  Icons.clear,
                  color: Colors.transparent,
                ),
                controller: last_name_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.025, bottom: h * 0.015),
                child: custom_text(
                    text: gmail, style: CustomStyle().style_16_medium(white)),
              ),
              custom_textformfield(
                hintText: gmail,
                suffixIcon: Icon(
                  Icons.clear,
                  color: Colors.transparent,
                ),
                controller: gmail_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter gmail';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.025, bottom: h * 0.015),
                child: custom_text(
                    text: phone_number,
                    style: CustomStyle().style_16_medium(white)),
              ),
              custom_textformfield(
                hintText: phone_number,
                suffixIcon: Icon(
                  Icons.clear,
                  color: Colors.transparent,
                ),
                controller: mobile_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: h * 0.05),
              custom_button(
                  width: w * 1,
                  onTap: () {
                    FocusScope.of(context).unfocus();
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

  PickedFile? ImageFile = null;
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      ImageFile = pickedFile!;
    });
  }
}
