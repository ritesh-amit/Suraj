import 'package:flutter/material.dart';
import 'package:suraj/Utils/SizeConfig.dart';
import 'package:suraj/Utils/constants.dart';
import 'package:suraj/drawers/drawer.dart';

class ChatSection extends StatefulWidget {
  @override
  _ChatSectionState createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return Scaffold(
      drawer: DrawerCode(),
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'Chats',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "Chat History Not Found",
            style: TextStyle(
                color: maC, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
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
