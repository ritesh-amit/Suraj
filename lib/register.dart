import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:suraj/forgotPassword.dart';
import 'package:suraj/login.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';

class Register extends StatefulWidget {
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pwdController2 = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool isVisible = false;
  bool isVisible2 = false;
  bool rad = false;

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
                      'images/2.jpg',
                      height: h * 300,
                    ),
                    Container(
                      width: b * 345,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(b * 10),
                      ),
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        style: txtS(Colors.black, 16, FontWeight.w500),
                        decoration: dec('Full Name'),
                      ),
                    ),
                    sh(10),
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
                    sh(10),
                    Container(
                      width: b * 345,
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
                          labelText: 'Enter Password',
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
                    sh(10),
                    Container(
                      width: b * 345,
                      child: TextField(
                        controller: pwdController2,
                        keyboardType: TextInputType.visiblePassword,
                        style: txtS(Colors.black, 16, FontWeight.w500),
                        obscuringCharacter: '*',
                        obscureText: !isVisible2,
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
                                  isVisible2 = !isVisible2;
                                });
                              },
                              child: Icon(
                                isVisible2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                                size: b * 16,
                              ),
                            ),
                          ),
                          labelText: 'Re-Enter Password',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              rad = !rad;
                            });
                          },
                          child: Container(
                            height: h * 18,
                            width: b * 18,
                            decoration: BoxDecoration(
                              color: rad ? maC : Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: b * 1,
                              ),
                            ),
                            child: rad
                                ? Icon(Icons.check,
                                    color: Colors.white, size: b * 14)
                                : sh(0),
                          ),
                        ),
                        SizedBox(width: b * 5),
                        Text(
                          'By clicking this you have read and agreed with our',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: b * 15,
                          ),
                        ),
                      ],
                    ),
                    sh(10),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: maC,
                          fontWeight: FontWeight.w700,
                          fontSize: b * 16,
                        ),
                      ),
                    ),
                    sh(30),
                    MaterialButton(
                      minWidth: b * 240,
                      splashColor: maC,
                      color: maC,
                      onPressed: () {
                        /*Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return CustomerRegister();
                    }),
                  );*/
                      },
                      padding: EdgeInsets.symmetric(
                          horizontal: b * 25, vertical: h * 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(b * 5),
                      ),
                      elevation: 0,
                      child: Text(
                        'Register',
                        style: txtS(Colors.white, 20, FontWeight.w300),
                      ),
                    ),
                    sh(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: txtS(textColor, 16, FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return Login();
                              }),
                            );
                          },
                          child: Text(
                            'LOG IN',
                            style: txtS(maC, 16, FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
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
}
