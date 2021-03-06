import 'package:flutter/material.dart';
import 'package:suraj/homePageService.dart';
import 'package:suraj/profileScreen/profilePageService.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MyHomePageServices extends StatefulWidget {
  final int newOrOld;
  MyHomePageServices({this.newOrOld});
  @override
  _MyHomePageServicesState createState() =>
      _MyHomePageServicesState(newCode: newOrOld);
}

class _MyHomePageServicesState extends State<MyHomePageServices> {
  final int newCode;
  _MyHomePageServicesState({this.newCode});
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePageService(),
    HomePageService(),
    HomePageService(),
    HomePageService()
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        backgroundColor: maC,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.book_online),
            title: Text('Bookings'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.chat),
            title: Text(
              'Chat',
            ),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.notifications_on),
            title: Text('Notifications'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_currentIndex),
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
