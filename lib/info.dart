import 'package:flutter/material.dart';
import 'package:suraj/details.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Info extends StatelessWidget {
  const Info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: maC,
            centerTitle: true,
          ),
          body: Container(
            child: Column(children: [
              sh(10),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 5),
                child: Row(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            width: SizeConfig.screenWidth * 0.7,
                            child: Text(
                              'Car Cleaning Service Delhi',
                              overflow: TextOverflow.ellipsis,
                              style: txtS(Colors.black, 20, FontWeight.w400),
                            ),
                          ),
                          sh(5),
                          Text(
                            'Name of the Company',
                            style: txtS(Colors.black45, 16, FontWeight.w400),
                          ),
                        ]),
                  ],
                ),
              ),
              sh(90),
              Container(
                height: h * 50,
                child: TabBar(
                    indicatorColor: maC,
                    labelPadding: EdgeInsets.zero,
                    labelColor: maC,
                    indicatorWeight: h * 2.5,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Text(
                          'Info',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: b * 14,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Work',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: b * 14,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Gallery',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: b * 14,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Reviews',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: b * 14,
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                flex: 4,
                child: TabBarView(children: [
                  Details(),
                  Container(
                    color: Color(0xffE5E5E5),
                    child: Center(
                      child: Text('Subject'),
                    ),
                  ),
                  Container(
                    color: Color(0xffE5E5E5),
                    child: Center(
                      child: Text('Student'),
                    ),
                  ),
                  Container(
                    color: Color(0xffE5E5E5),
                    child: Center(
                      child: Text('Time-Table'),
                    ),
                  ),
                ]),
              ),
            ]),
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
