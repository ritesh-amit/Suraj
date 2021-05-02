import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suraj/customerChoice.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import '../customerChoice.dart';

class Choice extends StatefulWidget {
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  SharedPreferences pref;

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
                  fontWeight: FontWeight.w600,
                  fontSize: b * 24,
                ),
              ),
              sh(30),
              Image.asset(
                'images/1.jpg',
                height: h * 400,
              ),
              Spacer(),
              MaterialButton(
                splashColor: maC,
                color: maC,
                onPressed: () {
                  setUserType('customer');
                },
                padding:
                    EdgeInsets.symmetric(horizontal: b * 25, vertical: h * 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 50),
                ),
                elevation: 0,
                child: Text(
                  'I am Customer',
                  style: txtS(Colors.white, 20, FontWeight.w300),
                ),
              ),
              sh(45),
              MaterialButton(
                color: maC,
                onPressed: () {
                  setUserType('provider');
                },
                splashColor: maC,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 60),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: b * 25, vertical: h * 15),
                elevation: 0,
                child: Text(
                  'I am Service Provider',
                  style: txtS(Colors.white, 20, FontWeight.w300),
                ),
              ),
              sh(40),
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

  setUserType(String userType) async {
    pref = await SharedPreferences.getInstance();

    pref.setString('currentUserType', userType);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return CustomerChoice();
    }));
  }
}
