// ignore_for_file: unused_local_variable, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:returno/utills/text_styles.dart';
import '../constants/colors_constant.dart';
import '../constants/image_constants.dart';

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
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: backgroundclr,
      key: scaffoldKey,
      drawer: Drawer_page(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.078),
        child: AppBar(
            shadowColor: appbar_shadow,
            elevation: 7,
            leading: TextButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: SvgPicture.asset(menu_icon),
            )),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: h * 0.87,
          child: RefreshIndicator(
            displacement: h * 0.125,
            color: Colors.blue,
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 65 - 0));
            },
            child: Center(
                child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overScroll) {
                overScroll.disallowGlow();
                return false;
              },
              child: PageView.builder(
                padEnds: true,
                allowImplicitScrolling: true,
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: h * 1,
                    width: w * 1,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.04155),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: h * 0.54,
                            width: w * 1,
                            margin: EdgeInsets.symmetric(vertical: h * 0.025),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(backgroung_home),
                                    fit: BoxFit.fill)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.04155,
                                        vertical: h * 0.01875),
                                    child: CircleAvatar(
                                        radius: 19,
                                        backgroundColor: black.withOpacity(0.5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isFavorite = !_isFavorite;
                                            });
                                            _controller.reverse().then(
                                                (value) =>
                                                    _controller.forward());
                                          },
                                          child: ScaleTransition(
                                              scale: Tween(begin: 0.7, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent: _controller,
                                                      curve: Curves.easeOut)),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(9),
                                                  child: Image.asset(
                                                    favorite_icon,
                                                    color: _isFavorite
                                                        ? red
                                                        : white,
                                                  ))),
                                        )))
                              ],
                            ),
                          ),
                          custom_text(
                              text: lorem_ipsum_text,
                              style: CustomStyle().style_18_medium(white)),
                          SizedBox(height: h * 0.011),
                          custom_text(
                              text: lerm_ipsum_sub_text,
                              style: CustomStyle().style1_15_reguler(white)),
                          SizedBox(height: h * 0.005),
                          custom_text(
                              text: lorem_2_sub_text,
                              style: CustomStyle().style_12_reguler(grey)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
          ),
        ),
      ),
    );
  }
}
