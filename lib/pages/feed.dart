import 'dart:io';
import 'package:apni_sawari/Widgets/drawer.dart';
import 'package:apni_sawari/pages/login_page.dart';
import '../auth/userData.dart';
import 'package:apni_sawari/utils/firebase_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/feedModel.dart';
import 'mapPage.dart';
class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

enum PageEnum {
  SignOut,
}

class _FeedState extends State<Feed> {

  _onSelect(PageEnum value) {
    switch (value) {
      case PageEnum.SignOut:
//        signOutGoogle();
//        signOutFacebook();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
        break;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new FirebaseNotifications().setUpFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FEED"),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<PageEnum>(
            offset: Offset(0,40),
            onSelected: _onSelect,
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => <PopupMenuEntry<PageEnum>>[
              PopupMenuItem<PageEnum>(
                  value: PageEnum.SignOut,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      Text("Sign out"),
                    ],
                  )
              ),
            ],
          )
        ],
      ),
      drawer: SafeArea(
        child: DrawerWidget(),
      ),
      body: ListView.builder(
          itemCount: dummyFeed.length,
          itemBuilder: (context, i) {
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipOval(
                          child: Image.network(
                            dummyFeed[i].userImageLink,
                            fit: BoxFit.fill,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                dummyFeed[i].userName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(dummyFeed[i].dateTime)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.near_me),
                              Text(dummyFeed[i].destination)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(dummyFeed[i].description),
                          ),
                        ],
                      ),
                    ),
//                    Container(
////                      decoration: BoxDecoration(
////                        color: Theme.of(context).primaryColor,
////                      ),
////                      width: 300,
////                      height: 150,
////                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.airline_seat_recline_normal),
                          Text(dummyFeed[i].seatsAvailable),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(Icons.directions_car),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(dummyFeed[i].vehicleName),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(Icons.attach_money),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(dummyFeed[i].estimatedAmount),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          RaisedButton(
                            child: Text("Book"),
                            onPressed: () {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Request Submitted"),
                              ));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
