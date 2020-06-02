import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigator {
  static navigateTo(context, widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget)
    );
  }
}