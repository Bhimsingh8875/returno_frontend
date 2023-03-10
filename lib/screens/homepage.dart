// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:returno/utills/text_styles.dart';
import '../constants/colors_constant.dart';
import '../constants/image_constants.dart';
import '../constants/media_quiery.dart';
import '../constants/text_constanst.dart';
import 'drawer/drawer_main_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  bool _isFavorite = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool like = false;
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: backgroundclr,
      key: scaffoldKey,
      drawer: Drawer_page(),
      appBar: AppBar(
          leading: TextButton(
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SvgPicture.asset(menu_icon),
        ),
      )),
      body: PageView.builder(
        itemCount: 10,
        pageSnapping: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: h * 1,
            width: w * 1,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.58,
                    width: w * 1,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(background_image),
                            fit: BoxFit.cover)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: black.withOpacity(0.5),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isFavorite = !_isFavorite;
                                    });
                                    _controller
                                        .reverse()
                                        .then((value) => _controller.forward());
                                  },
                                  child: ScaleTransition(
                                      scale: Tween(begin: 0.7, end: 1.0)
                                          .animate(CurvedAnimation(
                                              parent: _controller,
                                              curve: Curves.easeOut)),
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            favorite_icon,
                                            color: _isFavorite ? red : white,
                                          ))),
                                )))
                      ],
                    ),
                  ),
                  custom_text(
                      text: lorem_ipsum_text,
                      style: CustomStyle().style_18_medium(white)),
                  SizedBox(height: 8),
                  custom_text(
                      text: lerm_ipsum_sub_text,
                      style: CustomStyle().style_15_reguler(white)),
                  SizedBox(height: 8),
                  custom_text(
                      text: lorem_2_sub_text,
                      style: CustomStyle().style_12_reguler(grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
