import 'package:suraj/Utils/constants.dart';
import 'package:suraj/chatScreen.dart';
import 'drawers/drawer.dart';

import 'Utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return Scaffold(
      drawer: DrawerCode(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'Chats',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            sh(20),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return ChatScreen();
                            }),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: b * 20, vertical: h * 20),
                          margin: EdgeInsets.symmetric(horizontal: b * 10),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: maC, width: b * 1.5),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(b * 15),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Container(
                                    height: h * 65,
                                    width: b * 65,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  SizedBox(width: b * 10),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'John Car Repairing',
                                          style: txtS(Colors.black, 16,
                                              FontWeight.w500),
                                        ),
                                        Text(
                                          'Hi',
                                          style: txtS(Colors.black45, 14,
                                              FontWeight.w400),
                                        ),
                                        Container(
                                          width: b * 260,
                                          child: Row(
                                            children: [
                                              Text(
                                                ' ',
                                                style: txtS(Colors.black45, 12,
                                                    FontWeight.w400),
                                              ),
                                              Spacer(),
                                              Text(
                                                '21/04/2021 4:45',
                                                style: txtS(Colors.black45, 12,
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ]),
                              ]),
                        ),
                      ),
                      sh(15),
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 800);
  }
}
