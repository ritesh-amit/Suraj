import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suraj/home.dart';
import 'package:suraj/login.dart';
import 'package:suraj/models/currentUser.dart';
import 'package:suraj/testPage.dart';
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
  SharedPreferences pref;
  String uid = '';

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
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
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
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: txtS(Colors.black, 16, FontWeight.w500),
                        decoration: dec('Email Id'),
                      ),
                    ),
                    sh(10),
                    Container(
                      width: b * 345,
                      child: TextFormField(
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
                      child: TextFormField(
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
                        if (fieldValidation()) {
                          signUpEmail();
                        }
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

  bool fieldValidation() {
    if (pwdController.text != pwdController2.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password Mismatch"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    } else if (nameController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Name can't be empty"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    } else if (emailController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid Email"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    } else if (pwdController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password can't be empty"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    } else if (!rad) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Agree to TnC !"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    } else
      return true;
  }

  signUpEmail() async {
    String email = emailController.text;
    String pwd = pwdController.text;
    String name = nameController.text;
    FirebaseAuth auth = FirebaseAuth.instance;

    pref = await SharedPreferences.getInstance();
    String userType = pref.getString('currentUserType');

    bool newUser;

    await FirebaseAuth.instance
        .fetchSignInMethodsForEmail(email)
        .then((authList) {
      if (authList.isEmpty) {
        print("New User");
        newUser = true;
      } else {
        print("Already Registered");
        newUser = false;
      }
    });

    if (!newUser) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Already Registered")));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return Login();
      }), (route) => false);
    } else {
      CurrentUser currentUser = CurrentUser(
        name: name,
        email: email,
        userType: userType,
      );

      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: pwd)
            .then((credential) {
          if (credential.user != null) {
            uid = credential.user.uid;
            addUsertoDB(name, email, pwd, currentUser.userType);
          }
        }).catchError((eror) {
          print(eror);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(eror.message),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ));
          auth.currentUser.delete();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return Login();
          }), (route) => false);
        });
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ));
      } catch (e) {
        print(e);
      }
    }
  }

  addUsertoDB(String userName, String email, String pwd, String userType) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    String userName = nameController.text;
    String email = emailController.text;

    CurrentUser currentUser =
        CurrentUser(name: userName, email: email, uid: uid, userType: userType);

    Map<String, dynamic> map = currentUser.toMap();

    try {
      firestore.collection('users').doc(uid).set(map).whenComplete(() {
        print("User added to DB");
      });

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return MyHomePage();
      }), (route) => false);
    } catch (e) {
      print(e);
    }
  }
}
