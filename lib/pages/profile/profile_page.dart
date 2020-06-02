import 'package:apni_sawari/auth/userData.dart';
import 'package:apni_sawari/pages/messages_page.dart';
import 'package:apni_sawari/pages/signUpUploadDocuments.dart';
import 'package:apni_sawari/utils/custom-navigator.dart';
import 'package:flutter/material.dart';
import '../signUpPersonalInfo.dart';
import 'edit-profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  Text _headerText(final String name) {
    return Text(name, style: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold
    ));
  }
  Text _titleText(final String title) {
    return Text(title, style: TextStyle(fontWeight: FontWeight.bold));
  }
  Widget _action(final String name, IconData icon, Function() onPressed) {
    final size = MediaQuery.of(context).size.width / 5 - 20;

    return Column(children: <Widget>[
      InkWell(child: Container(
        width: size,
        height: size,
        child: Center(child: Icon(icon, color: Colors.white)),
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(size / 2)),
      ), onTap: onPressed),
      SizedBox(height: 5),
      Text(name, textAlign: TextAlign.center, style: TextStyle(fontSize: 11))
    ]);
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Profile"),),
          body: RefreshIndicator(
            color: Colors.blue,
            onRefresh: () async {

            },
            child: SingleChildScrollView(child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// AppBar Section.
                  Center(
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(65)
                      ),

                      child: Stack(children: <Widget>[
                        
                        Align(
                          alignment: Alignment(0.8, 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),

                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: RaisedButton(
                                padding: EdgeInsets.zero,
                                child: Icon(Icons.edit, size: 15),
                                onPressed: () async {
                                  await CustomNavigator.navigateTo(context, EditProfile());
                                  setState(() {});
                                }
                              ),
                            ),
                          )
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(child: Text(userName, style: TextStyle(fontSize: 17))),

                  SizedBox(height: 30),
                  Row(children: <Widget>[
                    _action("Manage Documents", Icons.edit, () {
                      CustomNavigator.navigateTo(context, SignUpUploadDocuments());
                    }),
                    _action("My Complaints", Icons.directions_car, () => {}),
                    _action("Favorites", Icons.favorite, () => {}),
                    _action("Messages", Icons.mail_outline, ()  {
                    CustomNavigator.navigateTo(context, MessagesPage());
                    }),
                  ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                  SizedBox(height: 30),

                  /// Details Section.
                  _headerText("Profile"),
                  Divider(thickness: 1),

                  SizedBox(height: 4),
                  _titleText("Full Name"),
                  SizedBox(height: 4),
                  Text(userName),
                  SizedBox(height: 16),

                  _titleText("Email"),
                  SizedBox(height: 4),
                  Text(userEmail),
                  SizedBox(height: 16),



                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
