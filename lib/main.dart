import 'package:flutter/material.dart';
import 'package:movie_app/src/app.dart';
import 'package:movie_app/src/locator.dart' as di;

void main() {
  // initialize all dependencies
  di.init();

  runApp(MyApp());
}
