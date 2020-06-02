import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'userData.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import '../pages/feed.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
final FacebookLogin fbLogin = FacebookLogin();

Future loginWithFacebook(BuildContext context) async{
  final facebookLogin = new FacebookLogin();

  final facebookLoginResult = await facebookLogin
      .logIn(['email', 'public_profile']);

  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.error:
      print(facebookLoginResult.errorMessage);
      break;

    case FacebookLoginStatus.cancelledByUser:
      print("CancelledByUser");
      break;

    case FacebookLoginStatus.loggedIn:
      print("LoggedIn");
      /// calling the auth mehtod and getting the logged user
      var firebaseUser = await firebaseAuthWithFacebook(
          token: facebookLoginResult.accessToken).whenComplete((){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Feed();
            },
          ),
        );
      }).catchError((e){
        print(e.toString());
      });
  }
}


Future<FirebaseUser> firebaseAuthWithFacebook({ FacebookAccessToken token}) async {
  AuthCredential credential= FacebookAuthProvider.getCredential(accessToken: token.token);
  AuthResult firebaseUser = await _auth.signInWithCredential(credential);
  updateLoggedInUserData(firebaseUser.user.displayName, firebaseUser.user.email, firebaseUser.user.photoUrl);
  return firebaseUser.user;
}


void signOutFacebook() async {
  await fbLogin.logOut();
  print("Facebook user signed out");
}
