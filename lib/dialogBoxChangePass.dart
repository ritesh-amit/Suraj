import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DialogBoxChangePass extends StatefulWidget {
  _DialogBoxChangePassState createState() => _DialogBoxChangePassState();
}

class _DialogBoxChangePassState extends State<DialogBoxChangePass> {
  ScrollController _scrollController = ScrollController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdController1 = TextEditingController();
  TextEditingController pwdController2 = TextEditingController();

  bool isLoggedInPressed = false;
  bool isVisible = false;
  List visible = [false, false, false];
  List<TextEditingController> _controller = [
    for (int i = 0; i < 3; i++) TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Dialog(
      insetPadding: EdgeInsets.only(top: h * 0),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: h * 26),
            padding: EdgeInsets.symmetric(horizontal: b * 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                field(0, "Old Password"),
                sh(10),
                field(1, "New Password"),
                sh(10),
                field(2, "Confirm Password"),
                sh(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      minWidth: b * 165,
                      splashColor: maC,
                      color: maC,
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(
                          horizontal: b * 25, vertical: h * 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(b * 50),
                      ),
                      elevation: 0,
                      child: Text(
                        'Save',
                        style: txtS(Colors.white, 20, FontWeight.w300),
                      ),
                    ),
                    MaterialButton(
                      minWidth: b * 165,
                      color: maC,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      splashColor: maC,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(b * 60),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: b * 25, vertical: h * 15),
                      elevation: 0,
                      child: Text(
                        'Cancel',
                        style: txtS(Colors.white, 20, FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget field(int count, String tit) {
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return Container(
      decoration: BoxDecoration(
        color: gc,
        borderRadius: BorderRadius.circular(b * 10),
      ),
      child: TextField(
        controller: _controller[count],
        keyboardType: TextInputType.visiblePassword,
        style: txtS(Colors.black, 16, FontWeight.w500),
        obscuringCharacter: '*',
        obscureText: !visible[count],
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: maC, width: b * 2),
            borderRadius: BorderRadius.circular(b * 5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: b * 1),
            borderRadius: BorderRadius.circular(b * 5),
          ),
          suffixIconConstraints:
              BoxConstraints(minWidth: b * 16, minHeight: h * 12),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: b * 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  visible[(count)] = !visible[(count)];
                });
              },
              child: Icon(
                visible[(count)] ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
                size: b * 16,
              ),
            ),
          ),
          labelText: tit,
          labelStyle: txtS(tc, 16, FontWeight.w400),
          isDense: true,
          contentPadding: EdgeInsets.only(
            top: h * 15,
            bottom: h * 15,
            right: b * 20,
            left: b * 20,
          ),
        ),
      ),
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

void dialogBoxChangePass(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DialogBoxChangePass();
    },
    animationType: DialogTransitionType.slideFromBottomFade,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 250),
  );
}
