import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/phone_verify.dart';

class FormCard extends StatefulWidget {
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final phoneFormKey = GlobalKey<FormState>();
  TextEditingController phoneNumber;
  bool incorrectNum = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumber = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumber.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Sign in with Phone Number" ,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: 10,
            ),
            Form(
              key: phoneFormKey,
              child: TextFormField(
                controller: phoneNumber,
                maxLength: 10,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                validator: (phoneNum) {
                  if (phoneNum.length<10 && incorrectNum!=false){
                    return 'Incorrect phone number';
                  }
                  else{
                    return null;
                  }
              },
                autovalidate: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 11.0),
                  prefixIcon: SizedBox(
                    width: 55,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Image.asset('assets/pakistan-flag-icon-256.png',scale: 12,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:2.0,bottom: 5),
                          child: Text("+92",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF17ead9),
                        Color(0xFF6078ea)
                      ]),
                      borderRadius: BorderRadius.circular(6.0),
                      ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if(phoneFormKey.currentState.validate()){
                          if(phoneNumber.text.length!=10){
                            setState(() {
                              incorrectNum=true;
                            });
                          }
                          else{
                            incorrectNum=false;
                          }
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return VerifyPage("+92"+'${phoneNumber.text}');
                              },
                            ),
                          );
                        print("+92"+'${phoneNumber.text}');
                        }
                      },
                      child: Center(
                        child: Text("Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins-Bold",
                                fontSize: 15,
                                letterSpacing: 1.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
