import 'package:flutter/material.dart';
import 'package:movie_app/src/data_source/api.dart';
import 'package:movie_app/src/app.dart';

void main() {
  Api api = Api();
  api.fetchGenreList();

  runApp(MyApp());
}
