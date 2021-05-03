import 'package:flutter/material.dart';
import 'package:suraj/drawer.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BookingList extends StatefulWidget {
  _BookingListState createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  final TextEditingController provider = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer: DrawerCode(),
      appBar: AppBar(
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'My Bookings',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            sh(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: b * 10),
              padding: EdgeInsets.symmetric(horizontal: b * 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(b * 5),
              ),
              child: Row(children: [
                Icon(Icons.search, color: Colors.grey),
                Container(
                  alignment: Alignment.center,
                  width: b * 300,
                  height: h * 45,
                  child: TextField(
                    controller: provider,
                    style: txtS(Colors.black, 16, FontWeight.w400),
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: txtS(Colors.black45, 14, FontWeight.w400),
                      hintText: 'Search By Provider',
                    ),
                  ),
                ),
              ]),
            ),
            sh(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: b * 10),
              padding:
                  EdgeInsets.symmetric(horizontal: b * 20, vertical: h * 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(color: maC, width: b * 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(b * 15),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking with Car Cleaning Service\nDelhi',
                      style: txtS(Colors.black, 18, FontWeight.w600),
                    ),
                    sh(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: h * 90,
                          width: b * 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(width: b * 10),
                        Column(
                          children: [
                            Container(
                              width: b * 220,
                              child: Row(
                                children: [
                                  Text(
                                    'Name of the company',
                                    style: txtS(
                                        Colors.black45, 16, FontWeight.w400),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\u20B9500',
                                    style:
                                        txtS(Colors.black, 16, FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: b * 220,
                              child: Row(
                                children: [
                                  Icon(MdiIcons.calendar,
                                      color: maC, size: b * 24),
                                  SizedBox(width: b * 5),
                                  Text(
                                    'Date: 22/01/2021 8:45Pm',
                                    style: txtS(
                                        Colors.black45, 12, FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: b * 220,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: maC, size: b * 24),
                                  SizedBox(width: b * 5),
                                  Container(
                                    width: b * 180,
                                    child: Text(
                                      'Address Address Address Address Address',
                                      overflow: TextOverflow.ellipsis,
                                      style: txtS(
                                          Colors.black45, 12, FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: b * 220,
                              child: Row(
                                children: [
                                  Icon(Icons.watch, color: maC, size: b * 24),
                                  SizedBox(width: b * 5),
                                  Text(
                                    'Waiting for worker response',
                                    overflow: TextOverflow.ellipsis,
                                    style: txtS(
                                        Colors.black45, 12, FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            sh(5),
                            Container(
                              width: b * 220,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.lock_clock,
                                      color: maC, size: b * 24),
                                  SizedBox(width: b * 5),
                                  Container(
                                    width: b * 180,
                                    child: Text(
                                      'Hey, for this work artist will take upto \u20B9500 for this booking',
                                      style: txtS(
                                          Colors.black45, 12, FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sh(10),
                    Container(
                      width: b * 360,
                      // padding: EdgeInsets.symmetric(horizontal: b * 20),
                      child: Row(children: [
                        Row(
                          children: [
                            Icon(MdiIcons.bagCarryOn, color: maC, size: b * 28),
                            SizedBox(width: b * 5),
                            Text(
                              "3 Jobs Completed",
                              style: txtS(Colors.grey, 14, FontWeight.w300),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          color: Colors.grey[300],
                          width: b * 1.5,
                          height: h * 30,
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
                      ]),
                    ),
                    Container(
                      color: Colors.grey[300],
                      height: h * 1.5,
                    ),
                    sh(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Cancel Booking',
                            style: txtS(maC, 20, FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    sh(20),
                  ]),
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
