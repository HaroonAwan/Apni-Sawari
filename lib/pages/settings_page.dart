import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(CupertinoIcons.back,color: Colors.black,),onPressed: (){
            Navigator.pop(context);
          },),
          title: Text("Settings",style: TextStyle(color: Colors.black),),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("My Location",style: TextStyle(color: Color(0xFF62728d),fontWeight: FontWeight.bold),),
                    ),
                    Expanded(child: Container()),
                    Icon(CupertinoIcons.forward),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Edit Profile",style: TextStyle(color: Color(0xFF62728d),fontWeight: FontWeight.bold)),
                    ),
                    Expanded(child: Container()),
                    Icon(CupertinoIcons.forward),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Verifications",style: TextStyle(color: Color(0xFF62728d),fontWeight: FontWeight.bold)),
                    ),
                    Expanded(child: Container()),
                    Icon(CupertinoIcons.forward),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Push Notifications",style: TextStyle(color: Color(0xFF62728d),fontWeight: FontWeight.bold)),
                    ),
                    Expanded(child: Container()),
                    Icon(CupertinoIcons.forward),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Language",style: TextStyle(color: Color(0xFF62728d),fontWeight: FontWeight.bold)),
                    ),
                    Expanded(child: Container()),
                    Text("ENGLISH",style: TextStyle(color: Color(0xFF62728d),fontWeight: FontWeight.bold)),
                    Icon(CupertinoIcons.forward),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Logout",style: TextStyle(color: Color(0xFF62728d),fontWeight: FontWeight.bold)),
                    ),
                    Expanded(child: Container()),
                    Icon(CupertinoIcons.forward),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
