import 'package:apni_sawari/Widgets/SocialIcons.dart';
import 'package:apni_sawari/Widgets/no-internet-widget.dart';
import 'package:apni_sawari/auth/facebookSignin.dart';
import 'package:apni_sawari/auth/googleSignin.dart';
import 'package:apni_sawari/pages/signUpUploadDocuments.dart';
import 'package:apni_sawari/services/connectivityService.dart';
import 'package:apni_sawari/utils/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/CustomIcons.dart';
import '../Widgets/custom-datepicker.dart';
import 'login_page.dart';

class SignUpPersonalInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpPersonalInfoState();
  }
}

class _SignUpPersonalInfoState extends State<SignUpPersonalInfo> {
  bool isInternetConnected;
  DateTime _contractStartDate = DateTime.now();
  List<String> states = [
    'Punjab',
    'Sindh',
    'Balochistan',
    'KPK',
  ];
  List<String> cities = [
  'Karachi'
  'Lahore',
  'Faisalabad',
  'Rawalpindi',
  'Gujranwala',
  'Peshawar',
  ];
  String selectedState;
  String selectedCity;
  @override
  Widget build(BuildContext context) {
    isInternetConnected = checkConnectionStatus(context);
    return Scaffold(
        bottomNavigationBar: !isInternetConnected ? ShowNoInternet() : null,
        body: ListView(
          children: <Widget>[
            Container(
              height: 490,
              decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black26,
                      offset: new Offset(0.0, 2.0),
                      blurRadius: 25.0,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Personal Information',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 9, right: 9, top: 32, bottom: 8),
                    child: DatePickerField(
                      title: "Date of Birth",
                      onChanged: (date) {
                        _contractStartDate = date;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Select your province'),
                      items: states
                          .map((states) => DropdownMenuItem<String>(
                          child: Text(states), value: states))
                          .toList(),
                      value: selectedState,
                      onChanged: (value) {
                        setState(() {
                          selectedState = value;
                        });
                      },
                    ),
                  ),Padding(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Select your city'),
                      items: cities
                          .map((cities) => DropdownMenuItem<String>(
                          child: Text(cities), value: cities))
                          .toList(),
                      value: selectedCity,
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Address',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpUploadDocuments();
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      )),

                ],
              ),
            ),
            SizedBox(
              height: (30),
            ),

          ],
        ));
  }
}
