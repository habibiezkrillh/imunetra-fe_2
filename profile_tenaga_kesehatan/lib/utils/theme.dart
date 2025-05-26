import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 14),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
  ),
);
