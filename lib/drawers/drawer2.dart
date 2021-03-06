import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';

class DrawerCode2 extends StatefulWidget {
  final String userName;
  final String email;
  DrawerCode2({
    this.userName,
    this.email,
  });
  _DrawerCode2State createState() => _DrawerCode2State();
}

class _DrawerCode2State extends State<DrawerCode2> {
  String name = '';
  String email = '';
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
              FutureBuilder(
                  future: getNameAndEmail(),
                  builder: (context, snap) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: txtS(Colors.white, 18, FontWeight.w400),
                        ),
                        sh(5),
                        Text(
                          email,
                          style: txtS(Colors.white, 18, FontWeight.w400),
                        ),
                      ],
                    );
                  }),
              sh(40),
              row(Icons.home, 'Home', null),
              row(Icons.book, 'Current Bookings', null),
              row(Icons.chat, 'Chats', null),
              row(Icons.book, 'My Bookings', null),
              row(Icons.receipt, 'Receipts', null),
              row(Icons.person, 'Profile', null),
              row(Icons.wallet_giftcard, 'My Wallet', null),
              row(Icons.attach_money, 'My Earning', null),
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

  Future getNameAndEmail() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((snap) {
      name = snap.data()['name'];
      email = snap.data()['email'];
    });
  }
}
