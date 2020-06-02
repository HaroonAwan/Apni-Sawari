
import 'package:flutter/material.dart';

import 'cross_fade_navigator.dart';


class MessagesPage extends StatefulWidget {
  @override
  createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("Messages"),
      centerTitle: true,
    ),
    key: _scaffoldKey,
    backgroundColor: Colors.white,

    body: SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: CrossFadeNavigator(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          firstTitle: "Sent",
          secondTitle: "Received",
          fontFamily: 'Quicksand',
          firstChild: MessagesTile(),
          secondChild: MessagesTile(true),
          index: 1,
        ),
      ),
    ),
  );
}



class MessagesTile extends StatefulWidget {
  final bool received;
  MessagesTile([this.received=false]);
  @override
  _MessagesTileState createState() => _MessagesTileState();
}

class _MessagesTileState extends State<MessagesTile> {



  @override
  Widget build(BuildContext context) {

            return ListView.builder(
                shrinkWrap: true,
                itemCount:  0,
                itemBuilder: (context, index) {
                  return ListTile(

                  );
                }
            );
  }
}




