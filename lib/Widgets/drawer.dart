
import 'package:apni_sawari/auth/userData.dart';
import 'package:apni_sawari/pages/contact_page.dart';
import 'package:apni_sawari/pages/login_page.dart';
import 'package:apni_sawari/pages/messages_page.dart';
import 'package:apni_sawari/pages/post-ride/main-post-ride.dart';
import 'package:apni_sawari/pages/profile/profile_page.dart';
import 'package:apni_sawari/pages/search_page.dart';
import 'package:apni_sawari/pages/settings_page.dart';
import 'package:apni_sawari/utils/custom-navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[

                AppBar(
                  automaticallyImplyLeading: false,

                  title: Image.asset("assets/apni_sawari.png", fit: BoxFit.cover,scale: 10,),

                  centerTitle: true,

                ),
                ExpansionTile(
                  title: Row(
                    children: <Widget>[
                      CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.person_pin,color: Colors.grey.shade700,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(userName.toUpperCase(),style: TextStyle(color: Colors.blue,fontSize:15,fontWeight: FontWeight.bold
                        ),),
                      ),
                    ],
                  ),
                  children: <Widget>[
                    ListTile(
                      dense:true,
                      title: Row(
                        children: <Widget>[
                          CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.directions_car,size: 17,color: Colors.grey.shade800),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("My Profile",style: TextStyle(
                            ),),
                          ),
                        ],
                      ),
                      onTap: () {
                        CustomNavigator.navigateTo(context, ProfilePage());
                      },
                    ),
                    ListTile(
                      dense:true,
                      title: Row(
                        children: <Widget>[
                          CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.directions_car,size: 17,color: Colors.grey.shade800),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("My Rides",style: TextStyle(
                            ),),
                          ),
                        ],
                      ),
                      onTap: () {

                      },
                    ),
                    Divider(),
                    ListTile(
                      dense:true,
                      title: Row(
                        children: <Widget>[
                          CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.description,size: 17,color: Colors.grey.shade800),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Requests",style: TextStyle(
                            ),),
                          ),
                        ],
                      ),
                      onTap: (){

                      },
                    ),
                    Divider(),
                    ListTile(
                      dense:true,
                      title: Row(
                        children: <Widget>[
                          CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.mail_outline,size: 17,color: Colors.grey.shade800),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Messages",style: TextStyle(
                            ),),
                          ),
                        ],
                      ),
                      onTap: (){
                        CustomNavigator.navigateTo(context, MessagesPage());

                      },
                    ),

                  ],
                ),
                Divider(),

                ListTile(
                  dense:true,
                  title: Row(
                    children: <Widget>[
                      CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.navigate_next),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Post a Ride",style: TextStyle(
                        ),),
                      ),
                      Container(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text("FREE", style: TextStyle(color: Colors.white, fontSize: 10))
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue, borderRadius: BorderRadius.circular(10)
                          )
                      )
                    ],
                  ),
                  onTap: (){
                    CustomNavigator.navigateTo(context, PetRelocationPage());
                  },
                ),
                Divider(),




                ListTile(
                  dense:true,
                  title: Row(
                    children: <Widget>[
                      CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.mail,color: Colors.grey.shade800,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Contact",style: TextStyle(
                        ),),
                      ),
                    ],
                  ),
                  onTap: (){
                    CustomNavigator.navigateTo(context, Contact());
                  },
                ),
                Divider(),
                 ListTile(
                  dense:true,
                  title: Row(
                    children: <Widget>[
                      CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.add_photo_alternate,color: Colors.grey.shade800,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Saved Gigs",style: TextStyle(
                        ),),
                      ),
                    ],
                  ),
                  onTap: (){
//                    CustomNavigator.navigateTo(context, SavedAds());
                  },
                ) ,
                Divider(),
                ListTile(
                  dense:true,
                  title: Row(
                    children: <Widget>[
                      CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.search,color: Colors.grey.shade800,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Search",style: TextStyle(
                        ),),
                      ),
                    ],
                  ),
                  onTap: (){
                    CustomNavigator.navigateTo(context, Search());
                  },
                ) ,

                ListTile(
                  dense:true,
                  title: Row(
                    children: <Widget>[
                      CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.settings,color: Colors.grey.shade800,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Settings",style: TextStyle(
                        ),),
                      ),
                    ],
                  ),
                  onTap: (){

                    CustomNavigator.navigateTo(context, Settings());
                  },
                ),

                Divider(),

               ListTile(
                  dense:true,
                  title: Row(
                    children: <Widget>[
                      CircleAvatar(maxRadius: 16,backgroundColor: Colors.white,child: Icon(Icons.exit_to_app, color: Colors.grey.shade800)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Logout",style: TextStyle()),
                      ),
                    ],
                  ),
                  onTap: ()  {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));

                  },
                ),

              ]),
        ),
      ),
    );
  }
}






