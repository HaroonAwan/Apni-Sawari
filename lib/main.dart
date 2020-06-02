import 'package:apni_sawari/pages/feed.dart';
import 'package:apni_sawari/pages/signUpUserInfo.dart';
import 'package:apni_sawari/utils/connectivity_status.dart';
import 'package:provider/provider.dart';
import 'pages/mapPage.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'services/connectivityService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      create: (context) => ConnectivityService().connectionStatusController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Apni Sawari',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),

    );
  }
}