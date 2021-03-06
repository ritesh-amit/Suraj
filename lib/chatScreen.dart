import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:suraj/Utils/constants.dart';
import 'Utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maC,
        centerTitle: true,
        title: Text(
          'John Car Repairing',
          style: txtS(Colors.white, 20, FontWeight.w400),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            sh(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 0),
                  padding:
                      EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 9),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: maC.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(b * 10),
                        topLeft: Radius.circular(b * 10),
                        topRight: Radius.circular(b * 10)),
                  ),
                  child: Text(
                    "Hi",
                    style: txtS(Colors.black54, 18, FontWeight.w400),
                  ),
                ),
              ],
            ),
            sh(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "22 Dec, 2020 02:51 PM",
                    style: txtS(Colors.black54, 12, FontWeight.w400),
                  ),
                ),
                SizedBox(width: b * 5),
                Icon(Icons.check, color: Colors.black54, size: b * 12),
                SizedBox(width: b * 20),
              ],
            ),
            Spacer(),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: b * 10, vertical: h * 4),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(MdiIcons.paperclip,
                        color: Colors.black, size: b * 30),
                  ),
                  SizedBox(
                    width: b * 1,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(MdiIcons.camera,
                        color: Colors.black, size: b * 30),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.grey.withOpacity(0.3)),
                    alignment: Alignment.center,
                    width: b * 280,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 5, bottom: 5, right: 10),
                      child: TextField(
                        controller: message,
                        style: txtS(Colors.black, 16, FontWeight.w400),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: txtS(Colors.black45, 16, FontWeight.w400),
                          hintText: 'Write Your Message',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child:
                        Icon(MdiIcons.send, color: Colors.black, size: b * 30),
                  ),
                ],
              ),
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
