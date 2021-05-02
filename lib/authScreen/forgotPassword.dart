import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter/cupertino.dart';

import 'login.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: txtS(Colors.white, 20, FontWeight.w300),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              sh(30),
              Image.asset(
                'images/3.jpg',
              ),
              sh(40),
              Container(
                width: b * 345,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(b * 10),
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: txtS(Colors.black, 16, FontWeight.w500),
                  decoration: dec('Your Email Id'),
                ),
              ),
              sh(50),
              MaterialButton(
                minWidth: b * 240,
                splashColor: maC,
                color: maC,
                onPressed: () {},
                padding:
                    EdgeInsets.symmetric(horizontal: b * 25, vertical: h * 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 60),
                ),
                elevation: 0,
                child: Text(
                  'SUBMIT',
                  style: txtS(Colors.white, 20, FontWeight.w300),
                ),
              ),
            ]),
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
      fontSize: SizeConfig.screenWidth * siz / 414,
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 896);
  }

  sendVerificationLink() async {
    String email = emailController.text;
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password reset link is sent to your email"),
        backgroundColor: Colors.yellow,
      ));

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return Login();
      }), (route) => false);
    });
  }
}
