import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:suraj/authScreen/login.dart';
import 'package:suraj/authScreen/register.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';

class CustomerChoice extends StatefulWidget {
  _CustomerChoiceState createState() => _CustomerChoiceState();
}

class _CustomerChoiceState extends State<CustomerChoice> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: b * 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sh(30),
              Text(
                'Welcome to Uclab Service App',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: b * 20,
                ),
              ),
              sh(5),
              Text(
                'Order, Get Work And Easy Pay.',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: b * 20,
                ),
              ),
              sh(30),
              Image.asset(
                'images/2.jpg',
                height: h * 400,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: b * 165,
                    splashColor: maC,
                    color: maC,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Register();
                      }));
                    },
                    padding: EdgeInsets.symmetric(
                        horizontal: b * 25, vertical: h * 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(b * 50),
                    ),
                    elevation: 0,
                    child: Text(
                      'Register',
                      style: txtS(Colors.white, 20, FontWeight.w300),
                    ),
                  ),
                  MaterialButton(
                    minWidth: b * 165,
                    color: maC,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    },
                    splashColor: maC,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(b * 60),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: b * 25, vertical: h * 15),
                    elevation: 0,
                    child: Text(
                      'LOG IN',
                      style: txtS(Colors.white, 20, FontWeight.w300),
                    ),
                  ),
                ],
              ),
              sh(120),
            ],
          ),
        ),
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
