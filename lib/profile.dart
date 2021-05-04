import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suraj/dialogBoxChangePass.dart';

import 'package:suraj/authScreen/login.dart';
import 'package:suraj/drawers/drawer.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File image1File;
  bool getImage = false;
  String imageLink = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: DrawerCode(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'Profile',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: h * 150,
            decoration: BoxDecoration(
              color: maC,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(b * 30),
                bottomRight: Radius.circular(b * 30),
              ),
            ),
          ),
          Container(
            height: SizeConfig.screenHeight * 0.8,
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: b * 20),
              children: [
                sh(75),
                InkWell(
                  splashColor: Colors.green,
                  child: getImage
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: b * 100),
                          height: h * 150,
                          width: b * 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.network(
                            imageLink,
                            fit: BoxFit.cover,
                            height: h * 150,
                            width: b * 150,
                          ),
                        )
                      : Container(
                          height: h * 150,
                          width: b * 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueGrey,
                          ),
                          child: Container(
                            child: Icon(Icons.add_a_photo,
                                color: rc, size: b * 40),
                          ),
                        ),
                ),
                sh(10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: b * 125),
                  child: MaterialButton(
                    minWidth: b * 100,
                    splashColor: maC,
                    color: maC,
                    onPressed: () {
                      pickImage();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(b * 5),
                    ),
                    elevation: 0,
                    child: Text(
                      'CHANGE',
                      style: txtS(Colors.white, 19, FontWeight.w300),
                    ),
                  ),
                ),
                sh(20),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Personal Information',
                            style: txtS(Colors.black, 18, FontWeight.w600),
                          ),
                        ],
                      ),
                      sh(20),
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
                          decoration: dec('Email'),
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
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Mobile Number'),
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
                          controller: genderController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Gender'),
                        ),
                      ),
                      sh(20),
                      Row(
                        children: [
                          Text(
                            'Set Address',
                            style: txtS(Colors.black, 18, FontWeight.w600),
                          ),
                        ],
                      ),
                      sh(10),
                      Container(
                        width: b * 345,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                        child: TextFormField(
                          controller: addressController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Enter Your Address'),
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
                          controller: cityController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('City'),
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
                          controller: countryController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Country'),
                        ),
                      ),
                      sh(10),
                      InkWell(
                        splashColor: maC,
                        highlightColor: maC,
                        onTap: () {},
                        child: Container(
                          width: b * 345,
                          padding: EdgeInsets.symmetric(
                              vertical: h * 15, horizontal: b * 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black, width: b * 1),
                            borderRadius: BorderRadius.circular(b * 5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Set Location',
                                style: txtS(tc, 16, FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      sh(50),
                      InkWell(
                        splashColor: maC,
                        highlightColor: maC,
                        onTap: () {
                          changeUserDetails();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: b * 20),
                          padding: EdgeInsets.symmetric(
                              vertical: h * 15, horizontal: b * 20),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: maC, width: b * 2),
                            borderRadius: BorderRadius.circular(b * 10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Save',
                                style: txtS(Colors.black, 20, FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      sh(10),
                      InkWell(
                        splashColor: maC,
                        highlightColor: maC,
                        onTap: () {
                          dialogBoxChangePass(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: b * 20),
                          padding: EdgeInsets.symmetric(
                              vertical: h * 15, horizontal: b * 20),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: maC, width: b * 2),
                            borderRadius: BorderRadius.circular(b * 10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Change Password',
                                style: txtS(Colors.black, 20, FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      sh(10),
                      InkWell(
                        splashColor: maC,
                        highlightColor: maC,
                        onTap: () {
                          logOut();
                        },
                        child: Container(
                          width: b * 320,
                          margin: EdgeInsets.symmetric(horizontal: b * 20),
                          padding: EdgeInsets.symmetric(
                              vertical: h * 15, horizontal: b * 20),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: maC, width: b * 2),
                            borderRadius: BorderRadius.circular(b * 10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Log Out',
                                style: txtS(Colors.black, 20, FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sh(100),
              ],
            ),
          ),
        ],
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

  pickImage() async {
    var picker = await ImagePicker().getImage(source: ImageSource.gallery);

    File selectedImage = File(picker.path);
    setState(() {
      image1File = selectedImage;
      getImage = true;
    });

    String uid = FirebaseAuth.instance.currentUser.uid;
    if (selectedImage != null) {
      FirebaseStorage.instance
          .ref('dp')
          .child(uid)
          .putFile(selectedImage)
          .then((taskSnap) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Profile image uploaded successfully"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ));
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error Encountered"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ));
      });
    }

    await FirebaseStorage.instance
        .ref('dp')
        .child(uid)
        .getDownloadURL()
        .then((link) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'image': link});
    });
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

  loadData() {
    String uid = FirebaseAuth.instance.currentUser.uid;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((snapshot) {
      setState(() {
        nameController.text = snapshot.data()['name'];
        emailController.text = snapshot.data()['email'];
        phoneController.text = snapshot.data()['phone'];
        genderController.text = snapshot.data()['gender'];
        addressController.text = snapshot.data()['address'];
        cityController.text = snapshot.data()['city'];
        countryController.text = snapshot.data()['country'];

        if (snapshot.data()['image'] != null) {
          imageLink = snapshot.data()['image'];
          getImage = true;
        }
      });
    });
  }

  changeUserDetails() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String gender = genderController.text.trim();
    String address = addressController.text.trim();
    String city = cityController.text.trim();
    String country = countryController.text.trim();
    String location = locationController.text.trim();

    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'address': address,
      'city': city,
      'country': country,
      'location': location,
    };

    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(map)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Data Changed Successfully"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ));
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error Encountered"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    });
  }

  logOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      await firebaseAuth.signOut().then((value) {
        preferences.clear();
        print("Signed Out");
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return Login();
          }),
          (route) => false,
        );
      }).catchError((e) {
        print(e.message);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error Encountered"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ));
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
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
