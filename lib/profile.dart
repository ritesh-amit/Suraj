import 'dart:io';

import 'package:flutter/material.dart';
import 'package:suraj/drawer.dart';
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
                          child: Image.file(
                            image1File,
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
                      style: txtS(Colors.white, 20, FontWeight.w300),
                    ),
                  ),
                ),
                sh(20),
                Row(
                  children: [
                    Text(
                      'Personal Information',
                      style: txtS(Colors.black, 18, FontWeight.w400),
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
                      style: txtS(Colors.black, 18, FontWeight.w500),
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
                      border: Border.all(color: Colors.black, width: b * 1),
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
                  onTap: () {},
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
                  onTap: () {},
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
