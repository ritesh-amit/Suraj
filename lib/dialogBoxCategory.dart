import 'package:flutter/material.dart';
import 'package:suraj/dialogBoxSub.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxCategory extends StatefulWidget {
  _DialogBoxCategoryState createState() => _DialogBoxCategoryState();
}

class _DialogBoxCategoryState extends State<DialogBoxCategory> {
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
    bool amit = true;
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Dialog(
      insetPadding: EdgeInsets.only(top: h * 300),
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
                  'Select Category',
                  textAlign: TextAlign.center,
                  style: txtS(textColor, 18, FontWeight.w600),
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
                          onTap: () {
                            Navigator.pop(context);
                            dialogBoxSubCategory(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: b * 20, vertical: h * 20),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey[300], width: b * 0.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(b * 10),
                            ),
                            child: Text(
                              category[index],
                              style: txtS(Colors.black, 16, FontWeight.w400),
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

void dialogBoxCategory(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxCategory();
    },
    animationType: DialogTransitionType.slideFromBottomFade,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 250),
  );
}
