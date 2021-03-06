import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suraj/authScreen/forgotPassword.dart';
import 'package:suraj/authScreen/register.dart';
import 'package:suraj/home/homeService.dart';
import 'package:suraj/testPage.dart';
import 'package:suraj/home/home.dart';
import 'package:suraj/homePage.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  SharedPreferences preferences;
  bool isLoggedInPressed = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: b * 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sh(30),
                    Image.asset(
                      'images/4.jpg',
                      height: h * 400,
                    ),
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
                        decoration: dec('Email Id'),
                      ),
                    ),
                    sh(30),
                    Container(
                      width: b * 345,
                      decoration: BoxDecoration(
                        color: gc,
                        borderRadius: BorderRadius.circular(b * 10),
                      ),
                      child: TextField(
                        controller: pwdController,
                        keyboardType: TextInputType.visiblePassword,
                        style: txtS(Colors.black, 16, FontWeight.w500),
                        obscuringCharacter: '*',
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maC, width: b * 2),
                            borderRadius: BorderRadius.circular(b * 5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: b * 1),
                            borderRadius: BorderRadius.circular(b * 5),
                          ),
                          suffixIconConstraints: BoxConstraints(
                              minWidth: b * 16, minHeight: h * 12),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: b * 15),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(
                                isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                                size: b * 16,
                              ),
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: txtS(tc, 16, FontWeight.w400),
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                            top: h * 15,
                            bottom: h * 15,
                            right: b * 20,
                            left: b * 20,
                          ),
                        ),
                      ),
                    ),
                    sh(40),
                    MaterialButton(
                      minWidth: b * 240,
                      splashColor: maC,
                      color: maC,
                      onPressed: () {
                        login();
                      },
                      padding: EdgeInsets.symmetric(
                          horizontal: b * 25, vertical: h * 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(b * 5),
                      ),
                      elevation: 0,
                      child: Text(
                        'LOGIN',
                        style: txtS(Colors.white, 20, FontWeight.w300),
                      ),
                    ),
                    sh(40),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ForgotPassword();
                          }),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: b * 16,
                        ),
                      ),
                    ),
                    sh(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: txtS(textColor, 16, FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) {
                              return Register();
                            }), (route) => false);
                          },
                          child: Text(
                            'Register',
                            style: txtS(maC, 16, FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    sh(20),
                  ],
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

  login() async {
    String email = emailController.text;
    String pwd = pwdController.text;
    preferences = await SharedPreferences.getInstance();
    String userType = preferences.getString('currentUserType');

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd)
          .then((credential) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Welcome Back"),
          backgroundColor: Color(0xff28797c),
          behavior: SnackBarBehavior.floating,
        ));
        preferences.setBool('isLoggedIn', true);

        preferences.setString('currentUserUID', credential.user.uid);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return userType == 'customer' ? MyHomePage() : MyHomePageServices();
        }), (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));

      setState(() {
        isLoggedInPressed = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoggedInPressed = false;
      });
    }
  }
}
