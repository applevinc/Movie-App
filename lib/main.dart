import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photoplay',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: '/',
    );
  }
}
