import 'package:flutter/material.dart';
import 'package:suraj/addMoney.dart';
import 'package:suraj/drawers/drawer.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Wallet extends StatefulWidget {
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final TextEditingController provider = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        drawer: DrawerCode(),
        appBar: AppBar(
          backgroundColor: maC,
          centerTitle: true,
          title: Text(
            'My Wallet',
            style: txtS(Colors.white, 20, FontWeight.w400),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              sh(50),
              Container(
                width: b * 400,
                margin: EdgeInsets.symmetric(horizontal: b * 40),
                padding: EdgeInsets.symmetric(vertical: h * 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(b * 60),
                  color: maC,
                ),
                child: Column(children: [
                  Text(
                    'Balance',
                    style: txtS(Colors.white, 20, FontWeight.w300),
                  ),
                  sh(20),
                  Text(
                    '\u20B95000',
                    style: txtS(Colors.white, 18, FontWeight.w400),
                  ),
                ]),
              ),
              sh(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: b * 100,
                    splashColor: maC,
                    color: maC,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return AddMoney();
                        }),
                      );
                    },
                    padding: EdgeInsets.symmetric(
                        horizontal: b * 25, vertical: h * 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(b * 50),
                    ),
                    elevation: 0,
                    child: Text(
                      'Add Money',
                      style: txtS(Colors.white, 14, FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: b * 20),
                ],
              ),
              sh(20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: b * 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(b * 60),
                  color: maC,
                ),
                height: h * 70,
                child: TabBar(
                    indicatorColor: Colors.white,
                    labelPadding: EdgeInsets.zero,
                    labelColor: Colors.white,
                    indicatorWeight: h * 7,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text(
                          'All',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: b * 18,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Debit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: b * 18,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Credit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: b * 18,
                          ),
                        ),
                      ),
                    ]),
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
