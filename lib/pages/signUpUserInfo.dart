import 'package:apni_sawari/Widgets/SocialIcons.dart';
import 'package:apni_sawari/Widgets/no-internet-widget.dart';
import 'package:apni_sawari/auth/facebookSignin.dart';
import 'package:apni_sawari/auth/googleSignin.dart';
import 'package:apni_sawari/pages/signUpPersonalInfo.dart';
import 'package:apni_sawari/services/connectivityService.dart';
import 'package:apni_sawari/utils/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/CustomIcons.dart';
import 'login_page.dart';

class SignUpUserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpUserInfoState();
  }
}

class _SignUpUserInfoState extends State<SignUpUserInfo> {
  bool isInternetConnected=true;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.all(16),
                        child: Text(
                            '',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),

                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Welcome to Apni Sawari.',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Let\'s get started!',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 32, bottom: 8),
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'E-Mail Address',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
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
                        hintText: 'Password',
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
                                  return SignUpPersonalInfo();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                horizontalLine(),
                Text("Social SignUp",
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: "Poppins-Medium")),
                horizontalLine()
              ],
            ),
            SizedBox(
              height: (30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialIcon(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),
                        ],
                        iconData: CustomIcons.facebook,
                        onPressed: () {
                          loginWithFacebook(context);
                        }),
                    SocialIcon(
                      colors: [
                        Color(0xFFff4f38),
                        Color(0xFFff355d),
                      ],
                      iconData: CustomIcons.googlePlus,
                      onPressed: () {
                        signInWithGoogle(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
