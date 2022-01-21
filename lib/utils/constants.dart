import 'package:flutter/material.dart';

class RoutingConstants {
  static const String HomePageRoute = '/';
  static const String AuthPageRoute = 'auth';
  static const String DetailPageRoute = 'detail';
  static const String SignUpROute = 'signUp';
  static const String SearchResultsRoute = 'searchResults';
}

final textFieldDecoration = InputDecoration(
  labelText: 'Email',
  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black45),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(5.0),
  ),
);
