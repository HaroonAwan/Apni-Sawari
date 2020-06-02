import 'package:apni_sawari/Widgets/no-internet-widget.dart';
import 'package:apni_sawari/auth/phoneSignin.dart';
import 'package:apni_sawari/services/connectivityService.dart';
import 'package:apni_sawari/utils/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class VerifyPage extends StatefulWidget {
  String inputNo;
  VerifyPage(this.inputNo);
  @override
  State<StatefulWidget> createState() {
    return _VerifyPageState();
  }
}

class _VerifyPageState extends State<VerifyPage> {
  String string = '';
  String code1 = '';
  String code2 = '';
  String code3 = '';
  String code4 = '';
  String code5 = '';
  String code6 = '';
  bool verify = false;

  bool isInternetConnected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyNumber(widget.inputNo,context);
  }

  @override
  Widget build(BuildContext context) {
    isInternetConnected = checkConnectionStatus(context);
    return Scaffold(
        bottomNavigationBar: !isInternetConnected ? ShowNoInternet() : null,
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text('Verify', style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 300,
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
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 16, top: 32),
                    child: Text(
                      'Verify your number',
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: '6 digit code sent to ',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextSpan(
                          text: '${widget.inputNo}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _inputFields(code1),
                        _inputFields(code2),
                        _inputFields(code3),
                        _inputFields(code4),
                        _inputFields(code5),
                        _inputFields(code6),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 0),
                        child: OutlineButton(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          textColor: Colors.red,
                          color: Colors.red,
                          borderSide: BorderSide(color: Colors.red),
                          child: Text(
                            'Resend',
                            style: TextStyle(),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: verify ? Colors.green : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: verify ? () {
                                signIn(string,context);
                              } : null,
                              icon: Icon(Icons.check),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('1'),
                      _createCalcButton('2'),
                      _createCalcButton('3'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('4'),
                      _createCalcButton('5'),
                      _createCalcButton('6'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('7'),
                      _createCalcButton('8'),
                      _createCalcButton('9'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton(''),
                      _createCalcButton('0'),
                      InkWell(
                          borderRadius: BorderRadius.circular(45),
                          onTap: () {
                            deleteCode();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              // decoration: BoxDecoration(shape: BoxShape.circle),
                              width: 50,
                              height: 50,
                              child: Icon(Icons.backspace)))
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _inputFields(String s) {
    return Container(
      alignment: Alignment.center,
     height: 45,
      width: 45,
      child: Text(
        s,
        style: TextStyle(fontSize: 28),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _createCalcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          updateCode(value);
        },
        child: Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(shape: BoxShape.circle),
          width: 50,
          height: 50,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  void updateCode(String value) {
    switch (string.length) {
      case 0:
        {
          setState(() {
            code1 = value;
          });
          break;
        }
      case 1:
        {
          setState(() {
            code2 = value;
          });
          break;
        }
      case 2:
        {
          setState(() {
            code3 = value;
          });
          break;
        }
      case 3:
        {
          setState(() {
            code4 = value;
          });
          break;
        }
        case 4:
        {
          setState(() {
            code5 = value;
          });
          break;
        }
        case 5:
        {
          setState(() {
            code6 = value;
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string += value;
    print(string);
    if (string.length > 5) {
      setState(() {
        verify = true;
      });
      return;
    } else {
      return;
    }
  }

  void deleteCode() {
    switch (string.length) {
      case 1:
        {
          setState(() {
            code1 = '';
          });
          break;
        }
      case 2:
        {
          setState(() {
            code2 = '';
          });
          break;
        }
      case 3:
        {
          setState(() {
            code3 = '';
          });
          break;
        }
      case 4:
        {
          setState(() {
            code4 = '';
          });
          break;
        }
        case 5:
        {
          setState(() {
            code5 = '';
          });
          break;
        }
        case 6:
        {
          setState(() {
            code6 = '';
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string = string.substring(0, string.length - 1);
    if(string.length < 6) {
      setState(() {
        verify = false;
      });
    }
    print(string);
  }
}