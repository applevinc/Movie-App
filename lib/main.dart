import 'package:flutter/material.dart';
import 'package:movie_app/myApp.dart';
import 'package:movie_app/service/movieService.dart';

void main() {
  runApp(MyApp());

  MovieService().fetchGenreList();
}
