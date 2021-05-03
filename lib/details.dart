import 'package:flutter/material.dart';
import 'package:suraj/booking.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: b * 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            sh(20),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: b * 20, vertical: h * 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300], width: b * 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(b * 10),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address",
                      style: txtS(Colors.black, 16, FontWeight.w500),
                    ),
                    sh(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: maC, size: b * 28),
                        Spacer(),
                        Container(
                          width: SizeConfig.screenWidth * 0.75,
                          child: Text(
                            "Address Address Address Address Address Address ",
                            style: txtS(Colors.black, 16, FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            sh(10),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: b * 20, vertical: h * 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300], width: b * 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(b * 10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: txtS(Colors.black, 16, FontWeight.w500),
                  ),
                  sh(10),
                  Container(
                    width: SizeConfig.screenWidth * 0.75,
                    child: Text(
                      "Address Address Address Address Address Address ",
                      style: txtS(Colors.black45, 16, FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            sh(10),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: b * 20, vertical: h * 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300], width: b * 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(b * 10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\u20B9500 fixed rate 10%",
                    style: txtS(maC, 14, FontWeight.w300),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.starOutline,
                          color: Colors.grey, size: b * 12),
                      Icon(MdiIcons.starOutline,
                          color: Colors.grey, size: b * 12),
                      Icon(MdiIcons.starOutline,
                          color: Colors.grey, size: b * 12),
                      Icon(MdiIcons.starOutline,
                          color: Colors.grey, size: b * 12),
                      Icon(MdiIcons.starOutline,
                          color: Colors.grey, size: b * 12),
                      SizedBox(width: b * 10),
                      Text(
                        '(0/5)',
                        overflow: TextOverflow.ellipsis,
                        style: txtS(maC, 14, FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sh(10),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: b * 20, vertical: h * 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300], width: b * 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(b * 10),
              ),
              child: Row(
                children: [
                  Icon(MdiIcons.bagCarryOn, color: maC, size: b * 28),
                  SizedBox(width: b * 5),
                  Text(
                    "3 Jobs Completed",
                    style: txtS(Colors.grey, 14, FontWeight.w300),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(MdiIcons.thumbUp, color: maC, size: b * 28),
                      SizedBox(width: b * 5),
                      Text(
                        '20% Completion',
                        style: txtS(Colors.grey, 14, FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sh(10),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: b * 20, vertical: h * 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300], width: b * 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(b * 10),
              ),
              child: Row(
                children: [
                  Text(
                    "Qualification",
                    style: txtS(Colors.grey[800], 16, FontWeight.w500),
                  ),
                ],
              ),
            ),
            sh(150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: b * 120,
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
                    'CHAT',
                    style: txtS(Colors.white, 12, FontWeight.w400),
                  ),
                ),
                MaterialButton(
                  minWidth: b * 120,
                  splashColor: maC,
                  color: maC,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Boooking();
                      }),
                    );
                  },
                  padding: EdgeInsets.symmetric(
                      horizontal: b * 25, vertical: h * 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(b * 5),
                  ),
                  elevation: 0,
                  child: Text(
                    'BOOK',
                    style: txtS(Colors.white, 12, FontWeight.w400),
                  ),
                ),
                MaterialButton(
                  minWidth: b * 120,
                  color: maC,
                  onPressed: () {},
                  splashColor: maC,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(b * 5),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: b * 25, vertical: h * 15),
                  elevation: 0,
                  child: Text(
                    'SERVICES',
                    style: txtS(Colors.white, 12, FontWeight.w400),
                  ),
                ),
              ],
            ),
            sh(30),
          ]),
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
