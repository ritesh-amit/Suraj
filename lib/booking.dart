import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Booking extends StatefulWidget {
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime _selectedDate;
  var formattedDate;

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
                    EdgeInsets.symmetric(horizontal: b * 15, vertical: h * 10),
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
                      'Booking Date',
                      style: txtS(Colors.black54, 16, FontWeight.w400),
                    ),
                    sh(10),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: b * 5, vertical: h * 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(b * 5),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _selectedDate == null
                                    ? Text(
                                        "No date Selected",
                                        style: txtS(Colors.black45, 18,
                                            FontWeight.w400),
                                      )
                                    : Text(
                                        _selectedDate.toString(),
                                        style: txtS(Colors.black45, 18,
                                            FontWeight.w400),
                                      ),
                                SizedBox(width: b * 100),
                                InkWell(
                                  onTap: () {
                                    _pickDateDialog();
                                  },
                                  child: Icon(MdiIcons.calendar, color: maC),
                                ),
                              ])
                        ],
                      ),
                    ),
                    sh(10),
                    Container(
                      color: Colors.grey[300],
                      height: h * 1,
                    ),
                    sh(10),
                    Text(
                      'Booking Address',
                      style: txtS(Colors.black54, 16, FontWeight.w400),
                    ),
                    sh(10),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: b * 5, vertical: h * 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(b * 5),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tap to Select Address",
                                style:
                                    txtS(Colors.black45, 16, FontWeight.w400),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Icon(Icons.location_on, color: maC),
                              ),
                            ]),
                      ),
                    ),
                    sh(20),
                  ],
                ),
              ),
              sh(50),
              MaterialButton(
                minWidth: b * 240,
                splashColor: maC,
                color: maC,
                onPressed: () {},
                padding:
                    EdgeInsets.symmetric(horizontal: b * 25, vertical: h * 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 5),
                ),
                elevation: 0,
                child: Text(
                  'Confirm Booking',
                  style: txtS(Colors.white, 14, FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickDateDialog() {
    showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.orange,
              onPrimary: Colors.white,
              surface: Colors.orange,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 8),
      lastDate: DateTime(2030, 8),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        var date1 = DateTime.parse(_selectedDate.toString());
        formattedDate = "${date1.day}-${date1.month}-${date1.year}";
      });
    });
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
