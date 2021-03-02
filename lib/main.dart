import 'package:flutter/material.dart';
import 'package:movie_app/data_source/api.dart';
import 'package:movie_app/app.dart';

void main() {
  Api api = Api();
  api.fetchGenreList();

  runApp(MyApp());
}
