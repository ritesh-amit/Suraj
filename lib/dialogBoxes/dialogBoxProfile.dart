import 'package:flutter/material.dart';
import 'package:suraj/profileScreen/profilePageService.dart';
import '../Utils/SizeConfig.dart';
import '../Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxProfile extends StatefulWidget {
  _DialogBoxProfileState createState() => _DialogBoxProfileState();
}

class _DialogBoxProfileState extends State<DialogBoxProfile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Dialog(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: h * 26),
          padding: EdgeInsets.symmetric(horizontal: b * 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Incomplete Profile',
                textAlign: TextAlign.center,
                style: txtS(Colors.black, 20, FontWeight.w600),
              ),
              sh(10),
              Text(
                'Please complete your Profile',
                textAlign: TextAlign.center,
                style: txtS(Colors.black, 16, FontWeight.w400),
              ),
              sh(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      textAlign: TextAlign.center,
                      style: txtS(maC, 16, FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: b * 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProfileService();
                      }));
                    },
                    child: Text(
                      'Yes!',
                      textAlign: TextAlign.center,
                      style: txtS(maC, 16, FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 800);
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }
}

void dialogBoxProfile(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxProfile();
    },
    animationType: DialogTransitionType.scale,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 250),
  );
}
