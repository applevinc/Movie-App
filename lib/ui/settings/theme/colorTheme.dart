import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  accentColor: const Color(0xffFFBB3B),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xff212121),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);

final lightTheme = ThemeData(
  primaryColor: const Color(0xffF5F5F5),
  brightness: Brightness.light,
  backgroundColor: const Color(0xffF5F5F5),
  accentColor: const Color(0xffFFBB3B),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: const Color(0xff898989),
  ),
);
