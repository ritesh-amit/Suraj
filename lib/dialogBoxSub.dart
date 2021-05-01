import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxSubCategory extends StatefulWidget {
  _DialogBoxSubCategoryState createState() => _DialogBoxSubCategoryState();
}

class _DialogBoxSubCategoryState extends State<DialogBoxSubCategory> {
  TextEditingController manualAmountController = TextEditingController();
  List category = [
    "Category",
    "Category",
    "Category",
    "Category",
    "Category",
    "Category",
    "Category",
    "Category",
    "Category",
  ];
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Dialog(
      backgroundColor: maC,
      insetPadding: EdgeInsets.only(top: h * 500, left: b * 20, right: b * 20),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: h * 26),
            padding: EdgeInsets.symmetric(horizontal: b * 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Sub-Category',
                  textAlign: TextAlign.center,
                  style: txtS(Colors.white, 18, FontWeight.w600),
                ),
                sh(20),
                ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: category.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Column(children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: b * 20, vertical: h * 20),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black, width: b * 0.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(b * 5),
                            ),
                            child: Text(
                              category[index],
                              style: txtS(Colors.black54, 16, FontWeight.w400),
                            ),
                          ),
                        ),
                        sh(15),
                      ]);
                    }),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 800);
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }
}

void dialogBoxSubCategory(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxSubCategory();
    },
    animationType: DialogTransitionType.slideFromBottomFade,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 250),
  );
}
