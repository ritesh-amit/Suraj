import 'package:flutter/material.dart';
import 'package:suraj/drawer.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Scaffold(
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
      body: Column(
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
        ],
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
