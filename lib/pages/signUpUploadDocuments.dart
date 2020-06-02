import 'package:apni_sawari/Widgets/SocialIcons.dart';
import 'package:apni_sawari/Widgets/no-internet-widget.dart';
import 'package:apni_sawari/auth/facebookSignin.dart';
import 'package:apni_sawari/auth/googleSignin.dart';
import 'package:apni_sawari/services/connectivityService.dart';
import 'package:apni_sawari/utils/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/custom-datepicker.dart';

class SignUpUploadDocuments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpUploadDocumentsState();
  }
}

class _SignUpUploadDocumentsState extends State<SignUpUploadDocuments> {
   bool isInternetConnected;
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
                      'Upload Documents',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child:   RaisedButton(
                      elevation: 15,
                      color: Colors.green,
                      highlightElevation: 30,
                      onPressed: () {},
                      onHighlightChanged: (value) {
                        print(value);
                      },
                      child: Text(
                        'Rounded Raised Button',
                        style: TextStyle(color: Colors.white),
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
                            Navigator.pushNamed(context, '/grocerry/verify');
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
