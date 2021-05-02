import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suraj/drawer.dart';
import 'package:suraj/home/homeService.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter/cupertino.dart';

class ProfileService extends StatefulWidget {
  @override
  _ProfileServiceState createState() => _ProfileServiceState();
}

class _ProfileServiceState extends State<ProfileService> {
  TextEditingController specialController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController descriController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios_rounded),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'Edit Personal Information',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.8,
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: b * 20),
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      sh(20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                        child: TextFormField(
                          controller: specialController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Your Speciality'),
                        ),
                      ),
                      sh(10),
                      Container(
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                        child: TextFormField(
                          controller: cityController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Your City'),
                        ),
                      ),
                      sh(10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                        child: TextFormField(
                          controller: countryController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Your Country'),
                        ),
                      ),
                      sh(10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                        child: TextFormField(
                          controller: locationController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Your Location'),
                        ),
                      ),
                      sh(10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                        child: TextFormField(
                          controller: rateController,
                          keyboardType: TextInputType.number,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('My Rate'),
                        ),
                      ),
                      sh(10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                        child: TextFormField(
                          controller: bioController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Your Bio'),
                        ),
                      ),
                      sh(30),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(b * 10),
                        ),
                        child: TextFormField(
                          controller: descriController,
                          keyboardType: TextInputType.name,
                          style: txtS(Colors.black, 16, FontWeight.w500),
                          decoration: dec('Write Description'),
                        ),
                      ),
                      sh(50),
                      MaterialButton(
                        minWidth: b * 240,
                        splashColor: maC,
                        color: maC,
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(
                            horizontal: b * 25, vertical: h * 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(b * 5),
                        ),
                        elevation: 0,
                        child: Text(
                          'SUBMIT',
                          style: txtS(Colors.white, 20, FontWeight.w300),
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

  saveData() {
    String uid = FirebaseAuth.instance.currentUser.uid;

    String speciality = specialController.text.trim();
    String name = nameController.text.trim();
    String city = cityController.text.trim();
    String country = countryController.text.trim();
    String location = locationController.text.trim();
    String rate = rateController.text.trim();
    String bio = bioController.text.trim();
    String des = descriController.text.trim();

    Map<String, dynamic> map = {
      'name': name,
      'speciality': speciality,
      'city': city,
      'country': country,
      'location': location,
      'rate': rate,
      'bio': bio,
      'des': des
    };

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(map)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Profile Updated"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ));

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return MyHomePageServices();
      }), (route) => false);
    });
  }
}
