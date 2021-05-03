import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Boooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: maC,
          centerTitle: true,
          title: Text(
            'Booking Information',
            style: txtS(Colors.white, 20, FontWeight.w400),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              sh(20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: b * 10),
                padding:
                    EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: SizeConfig.screenWidth * 0.6,
                                child: Text(
                                  'Car Cleaning Service Delhi',
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      txtS(Colors.black, 20, FontWeight.w400),
                                ),
                              ),
                              sh(5),
                              Text(
                                'Name of the Company',
                                style:
                                    txtS(Colors.black45, 16, FontWeight.w400),
                              ),
                            ]),
                      ],
                    ),
                    sh(20),
                    Container(
                      height: h * 1,
                      color: Colors.grey,
                    ),
                    sh(20),
                    Text(
                      'Booking Price',
                      style: txtS(Colors.black45, 16, FontWeight.w400),
                    ),
                    sh(5),
                    Text(
                      '\u20B9 500 Fixed Rate',
                      style: txtS(Colors.black, 16, FontWeight.w400),
                    ),
                    sh(20),
                  ],
                ),
              ),
              sh(30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: b * 10),
                padding:
                    EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 10),
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
              ),
            ],
          ),
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
