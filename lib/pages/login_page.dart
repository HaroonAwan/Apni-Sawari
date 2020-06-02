import 'package:apni_sawari/Widgets/no-internet-widget.dart';
import 'package:apni_sawari/auth/googleSignin.dart';
import 'package:apni_sawari/pages/signUpUserInfo.dart';
import 'package:apni_sawari/services/connectivityService.dart';
import 'package:apni_sawari/utils/connectivity_status.dart';
import 'package:provider/provider.dart';
import '../auth/facebookSignin.dart';
import '../Widgets/FormCard.dart';
import '../Widgets/SocialIcons.dart';
import '../Widgets/CustomIcons.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isInternetConnected;

  @override
  Widget build(BuildContext context) {
    isInternetConnected = checkConnectionStatus(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: !isInternetConnected ? ShowNoInternet() : null,

        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            SizedBox(height: 40),
            Center(
                child: Image(
                    image: AssetImage("assets/apni_sawari.png"), height: 80.0)),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FormCard(),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                horizontalLine(),
                Text("Social Login",
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: "Poppins-Medium")),
                horizontalLine()
              ],
            ),
            SizedBox(
              height: (40),
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
            SizedBox(
              height: 30,
            ),
//            _signInButton(),
//            _signInButtonFB(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "New User? ",
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpUserInfo();
                        },
                      ),
                    );
                  },
                  child: Text("SignUp",
                      style: TextStyle(
                        color: Color(0xFF5d74e3),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 90,
        height: 1.0,
        color: Colors.black26.withOpacity(.2),
      ),
    );
