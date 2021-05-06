import 'package:flutter/material.dart';
import 'package:suraj/Utils/SizeConfig.dart';
import 'package:suraj/Utils/constants.dart';

class PayNow extends StatefulWidget {
  @override
  _PayNowState createState() => _PayNowState();
}

class _PayNowState extends State<PayNow> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'Payment',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                "Pay Now",
                style: txtS(Colors.white, 18, FontWeight.w400),
              ),
              minWidth: b * 100,
              splashColor: maC,
              color: maC,
              padding:
                  EdgeInsets.symmetric(horizontal: b * 25, vertical: h * 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(b * 8),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }
}
