import 'package:flutter/material.dart';
import 'package:movie_app/dataSource/api.dart';
import 'package:movie_app/myApp.dart';

void main() {
  Api api = Api();
  api.fetchGenreList();

  runApp(MyApp());
}
