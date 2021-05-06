import 'package:flutter/material.dart';
import 'package:suraj/dialogBoxes/dialogBoxPayment.dart';
import 'package:suraj/drawers/drawer.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';

class AddMoney extends StatefulWidget {
  _AddMoneyState createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  final TextEditingController money = TextEditingController();

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
          'Add Money',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              sh(50),
              Container(
                width: b * 400,
                margin: EdgeInsets.symmetric(horizontal: b * 40),
                padding: EdgeInsets.symmetric(vertical: h * 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(b * 60),
                  color: maC,
                ),
                child: Column(children: [
                  Text(
                    'Balance',
                    style: txtS(Colors.white, 20, FontWeight.w300),
                  ),
                  sh(20),
                  Text(
                    '\u20B95000',
                    style: txtS(Colors.white, 18, FontWeight.w400),
                  ),
                ]),
              ),
              sh(20),
              Image.asset(
                'images/4.jpg',
                height: h * 300,
              ),
              Container(
                width: b * 345,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(b * 10),
                ),
                child: TextField(
                  controller: money,
                  keyboardType: TextInputType.emailAddress,
                  style: txtS(Colors.black, 16, FontWeight.w500),
                  decoration: dec('Enter Amount'),
                ),
              ),
              sh(40),
              MaterialButton(
                minWidth: b * 240,
                splashColor: maC,
                color: maC,
                onPressed: () {
                  dialogBoxPayment(context);
                },
                padding:
                    EdgeInsets.symmetric(horizontal: b * 25, vertical: h * 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 5),
                ),
                elevation: 0,
                child: Text(
                  'Add Money',
                  style: txtS(Colors.white, 16, FontWeight.w500),
                ),
              ),
            ],
          ),
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
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 800);
  }
}
