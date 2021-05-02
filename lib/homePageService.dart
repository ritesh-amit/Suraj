import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:suraj/dialogBoxProfile.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePageService extends StatefulWidget {
  @override
  _HomePageServiceState createState() => _HomePageServiceState();
}

class _HomePageServiceState extends State<HomePageService> {
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
          'Find Jobs',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            sh(5),
            Container(
              height: h * 250,
              width: SizeConfig.screenWidth * 0.98,
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
            sh(20),
            Text(
              "JOBS Not FOUND",
              style: txtS(maC, 22, FontWeight.w500),
            ),
            sh(200),
            Padding(
              padding: EdgeInsets.only(right: b * 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: b * 120,
                    splashColor: maC,
                    color: maC,
                    onPressed: () {
                      dialogBoxProfile(context);
                    },
                    padding: EdgeInsets.symmetric(
                        horizontal: b * 25, vertical: h * 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(b * 60),
                    ),
                    elevation: 0,
                    child: Text(
                      'Applied Jobs',
                      style: txtS(Colors.white, 18, FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ]),
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
