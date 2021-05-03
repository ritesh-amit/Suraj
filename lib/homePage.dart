import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:suraj/dialogBoxCategory.dart';
import 'package:suraj/drawers/drawer.dart';
import 'package:suraj/info.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  Location location = Location();
  bool serviceEnabled;
  PermissionStatus permissionStatus;
  LocationData locationData;

  @override
  void initState() {
    super.initState();
    locationRequest();
  }

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
          'Service',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            InkWell(
              onTap: () {
                dialogBoxCategory(context);
              },
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 15),
                padding:
                    EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(b * 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Categories',
                      style: txtS(Colors.black, 16, FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: h * 250,
              width: SizeConfig.screenWidth * 1,
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 200),
                dotSize: b * 5,
                dotIncreasedColor: Colors.white,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 0.0,
                showIndicator: true,
                indicatorBgPadding: b * 10,
                images: [
                  ExactAssetImage("images/1.jpg"),
                  ExactAssetImage("images/1.jpg"),
                  ExactAssetImage("images/1.jpg"),
                  ExactAssetImage("images/1.jpg"),
                ],
              ),
            ),
            sh(10),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 5,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Info();
                            },
                          ),
                        );
                      },
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: b * 10, vertical: h * 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: b * 10, vertical: h * 10),
                          height: h * 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: maC, width: b * 1.5),
                            borderRadius: BorderRadius.circular(b * 10),
                          ),
                          child: Column(
                            children: [
                              Row(
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name of the Company',
                                        style: txtS(Colors.black45, 12,
                                            FontWeight.w400),
                                      ),
                                      sh(5),
                                      Row(
                                        children: [
                                          Container(
                                            width: SizeConfig.screenWidth * 0.4,
                                            child: Text(
                                              'Car Cleaning Service Delhi',
                                              overflow: TextOverflow.ellipsis,
                                              style: txtS(Colors.black, 16,
                                                  FontWeight.w400),
                                            ),
                                          ),
                                          Icon(MdiIcons.heartOutline,
                                              color: Colors.grey),
                                        ],
                                      ),
                                      Container(
                                        width: SizeConfig.screenWidth * 0.63,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '',
                                              style: txtS(
                                                  maC, 16, FontWeight.w600),
                                            ),
                                            Spacer(),
                                            Text(
                                              '\u20B9500 Fixed Rate',
                                              style: txtS(
                                                  maC, 16, FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              sh(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: maC, size: b * 16),
                                      Container(
                                        width: SizeConfig.screenWidth * 0.2,
                                        child: Text(
                                          'Car Cleaning Service Delhi',
                                          overflow: TextOverflow.ellipsis,
                                          style: txtS(Colors.black45, 14,
                                              FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: maC, size: b * 16),
                                      Container(
                                        width: SizeConfig.screenWidth * 0.3,
                                        child: Text(
                                          '108 Km from You',
                                          overflow: TextOverflow.ellipsis,
                                          style: txtS(Colors.black45, 14,
                                              FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.lock_clock,
                                          color: maC, size: b * 16),
                                      Container(
                                        width: SizeConfig.screenWidth * 0.2,
                                        child: Text(
                                          '26 Days ago',
                                          overflow: TextOverflow.ellipsis,
                                          style: txtS(Colors.black45, 14,
                                              FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              sh(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(MdiIcons.starOutline,
                                          color: Colors.grey, size: b * 16),
                                      Icon(MdiIcons.starOutline,
                                          color: Colors.grey, size: b * 16),
                                      Icon(MdiIcons.starOutline,
                                          color: Colors.grey, size: b * 16),
                                      Icon(MdiIcons.starOutline,
                                          color: Colors.grey, size: b * 16),
                                      Icon(MdiIcons.starOutline,
                                          color: Colors.grey, size: b * 16),
                                      Text(
                                        '(0/5)',
                                        overflow: TextOverflow.ellipsis,
                                        style: txtS(maC, 14, FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth * 0.2,
                                    child: Text(
                                      '3 Jobs Done',
                                      overflow: TextOverflow.ellipsis,
                                      style: txtS(
                                          Colors.black45, 14, FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth * 0.25,
                                    child: Text(
                                      '21% Completion',
                                      overflow: TextOverflow.ellipsis,
                                      style: txtS(
                                          Colors.black45, 14, FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                    );
                  }),
            ),
          ]),
        ),
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

  locationRequest() async {
    serviceEnabled = await location.serviceEnabled();
    bool permissionsOK;

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (serviceEnabled)
        permissionsOK = true;
      else
        permissionsOK = false;
    } else
      permissionsOK = true;

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();

      if (permissionStatus == PermissionStatus.denied ||
          permissionStatus == PermissionStatus.deniedForever) {
        permissionsOK = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Permission Required"),
          backgroundColor: Colors.red,
        ));
      } else
        permissionsOK = true;
    } else if (permissionStatus == PermissionStatus.deniedForever)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Insufficient Permission"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    else
      permissionsOK = true;

    if (permissionsOK) {
    } else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Insufficient Permission"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
  }
}
