import 'package:flutter/material.dart';
import 'package:suraj/dialogBoxCategory.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Scaffold(
      drawer: DrawerCode(),
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'Service',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            InkWell(
              onTap: () {
                dialogBoxCategory(context);
              },
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 15),
                padding:
                    EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(b * 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Categories',
                      style: txtS(Colors.black, 16, FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: h * 250,
              width: SizeConfig.screenWidth * 1,
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 200),
                dotSize: b * 5,
                dotIncreasedColor: Colors.white,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 0.0,
                showIndicator: true,
                indicatorBgPadding: b * 10,
                images: [
                  ExactAssetImage("images/1.jpg"),
                  ExactAssetImage("images/1.jpg"),
                  ExactAssetImage("images/1.jpg"),
                  ExactAssetImage("images/1.jpg"),
                ],
              ),
            ),
            sh(10),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 20,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Column(children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: b * 10, vertical: h * 10),
                        height: h * 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: maC, width: b * 2),
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                      ),
                    ]);
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  InputDecoration dec(String txt) {
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: maC, width: b * 2),
        borderRadius: BorderRadius.circular(b * 5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: b * 1),
        borderRadius: BorderRadius.circular(b * 5),
      ),
      labelText: txt,
      labelStyle: TextStyle(
        color: tc,
        fontSize: b * 16,
        fontWeight: FontWeight.w400,
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: h * 15,
        horizontal: b * 20,
      ),
    );
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 414,
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 896);
  }
}
