import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';

class DrawerCode extends StatefulWidget {
  final String userName;
  final String email;
  DrawerCode({
    this.userName,
    this.email,
  });
  _DrawerCodeState createState() => _DrawerCodeState();
}

class _DrawerCodeState extends State<DrawerCode> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: b * 20),
          color: maC,
          child: ListView(
            children: [
              sh(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: b * 120,
                    height: h * 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              sh(15),
              Text(
                "Name",
                style: txtS(Colors.white, 18, FontWeight.w400),
              ),
              sh(5),
              Text(
                "Email",
                style: txtS(Colors.white, 18, FontWeight.w400),
              ),
              sh(40),
              row(Icons.home, 'Home', null),
              row(Icons.book, 'My Bookings', null),
              row(Icons.chat, 'Chats', null),
              row(Icons.receipt, 'Receipt', null),
              row(Icons.person_search_outlined, 'Search Jobs', null),
              row(Icons.wallet_giftcard, 'My Wallet', null),
              row(Icons.person, 'Profile', null),
              row(Icons.notifications, 'Notifications', null),
            ],
          ),
        ),
      ),
    );
  }

  InkWell row(ic, String tit, dynamic nextPage) {
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return InkWell(
      splashColor: maC,
      onTap: () {
        /*    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return nextPage;
        }));*/
      },
      child: Container(
        height: h * 55,
        child: Row(
          children: [
            Icon(ic, color: Colors.white, size: b * 28),
            SizedBox(width: b * 20),
            Text(
              tit,
              style: txtS(Colors.white, 18, FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 800);
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }
}
