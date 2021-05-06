import 'package:flutter/material.dart';
import 'package:suraj/payNow.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxPayment extends StatefulWidget {
  _DialogBoxPaymentState createState() => _DialogBoxPaymentState();
}

class _DialogBoxPaymentState extends State<DialogBoxPayment> {
  List category = [
    "PayPal",
    "RazorPay",
    "Paytm",
    "Google Pay",
    "PhonePe",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Dialog(
      insetPadding: EdgeInsets.only(top: h * 350),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: h * 20),
            padding: EdgeInsets.symmetric(horizontal: b * 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: b * 300,
                  splashColor: maC,
                  color: maC,
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(
                      horizontal: b * 25, vertical: h * 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(b * 60),
                  ),
                  elevation: 0,
                  child: Text(
                    'Payment Option',
                    style: txtS(Colors.white, 20, FontWeight.w300),
                  ),
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
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return PayNow();
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: b * 20, vertical: h * 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(b * 5),
                            ),
                            child: Text(
                              category[index],
                              style: txtS(maC, 14, FontWeight.w500),
                            ),
                          ),
                        ),
                        sh(15),
                      ]);
                    }),
                MaterialButton(
                  minWidth: b * 240,
                  splashColor: maC,
                  color: maC,
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(
                      horizontal: b * 25, vertical: h * 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(b * 60),
                  ),
                  elevation: 0,
                  child: Text(
                    'Cancel',
                    style: txtS(Colors.white, 20, FontWeight.w300),
                  ),
                ),
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

void dialogBoxPayment(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxPayment();
    },
    animationType: DialogTransitionType.slideFromBottomFade,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 250),
  );
}
