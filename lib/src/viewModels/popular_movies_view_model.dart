import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/src/data_source/api.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/viewModels/movie_view_model.dart';

class PopularMoviesViewModel extends ChangeNotifier {
  Api _api = Api();
  List<MovieViewModel> _movies = [];
  bool isRefreshing = false;

  List<MovieViewModel> get movies => _movies;

  Future<List<Movie>> getPopularMovies() async {
    //Generate random page number
    Random random = new Random();
    final int pageNumber = random.nextInt(100);

    List<Movie> fetchedMoviesList = await _api.fetchPopularMovies(pageNumber);

    if (isRefreshing == true) {
      _movies = fetchedMoviesList
          .map((movie) => MovieViewModel(movie: movie))
          .toList();

      // To toggle back isRefreshing state to initial so as
      // not to always run this if statement block
      isRefreshing = false;

      notifyListeners();
    }

    _movies.addAll(fetchedMoviesList
        .map((movie) => MovieViewModel(movie: movie))
        .toList());

    notifyListeners();
    return fetchedMoviesList;
  }
}
