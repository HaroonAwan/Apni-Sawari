import 'package:apni_sawari/pages/feed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'userData.dart';
String smsCode;
String verificationId;

Future verifyNumber(String inputNo,BuildContext context) async{
  final PhoneCodeAutoRetrievalTimeout autoRetrieve=(String verID){
    verificationId=verID;
    ///Dialog here
//    smsCodeDialog(context);
  };

  final PhoneVerificationCompleted verificationSuccess=(AuthCredential credential) async {
    print("Verified");
    await FirebaseAuth.instance.signInWithCredential(credential).then((user){
      print("Signed in");
      updateLoggedInUserData('Haroon', 'haroon@haroon.com', 'https://image.freepik.com/free-vector/businessman-character-avatar-icon-vector-illustration-design_24877-18271.jpg');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Feed();
          },
        ),
      );
    }).catchError((e)=>print(e));

  };

  final PhoneCodeSent smsCodeSent=(String verID,[int forceCodeResend]){
    verificationId=verID;
  };

  final PhoneVerificationFailed verificationFailed=(AuthException exception){
    print('$exception.message');
  };

  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: inputNo,
      codeAutoRetrievalTimeout: autoRetrieve,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verificationSuccess,
      verificationFailed: verificationFailed
  );
}

signIn(String inputCode,BuildContext context)async{
  final AuthCredential credential= PhoneAuthProvider.getCredential(
    verificationId: verificationId,
    smsCode: inputCode,
  );
  await FirebaseAuth.instance.signInWithCredential(credential).then((user){
    print("Signed in");
    updateLoggedInUserData('asd', 'sadsda', 'https://avatars1.githubusercontent.com/u/35136541?s=40&v=4');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Feed();
        },
      ),
    );
  }).catchError((e)=>print(e));

}