import 'package:suraj/Utils/constants.dart';
import 'drawers/drawer.dart';

import 'Utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
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
          'Notifications',
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
                  itemCount: 2,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Column(children: [
                      InkWell(
                        onTap: () {},
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
                                Row(
                                  children: [
                                    Text(
                                      "21 days ago",
                                      style: txtS(
                                          Colors.black54, 14, FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      "4:58 PM",
                                      style: txtS(maC, 14, FontWeight.w400),
                                    ),
                                  ],
                                ),
                                sh(8),
                                Text(
                                  "Ramson Car Service has reached to your location",
                                  style:
                                      txtS(Colors.black, 16, FontWeight.w500),
                                ),
                                sh(8),
                                Text(
                                  "Click to get location ",
                                  style:
                                      txtS(Colors.black54, 15, FontWeight.w400),
                                ),
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
