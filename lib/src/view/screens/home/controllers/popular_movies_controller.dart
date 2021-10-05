import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/usecases/fetch_popular_movies_usecase.dart';

class GetPopularMoviesController extends ChangeNotifier {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  GetPopularMoviesController(this.getPopularMoviesUsecase);

  bool isRefreshing = false;

  List<MovieEntity> _movies;
  List<MovieEntity> get movies => _movies;

  Future<List<MovieEntity>> getPopularMovies() async {
    Random random = Random();
    int rand = random.nextInt(501);
    if (rand == 0) {
      rand = 1;
    }

    _movies = await getPopularMoviesUsecase.call(rand);

    // List<MovieEntity> fetchedMoviesList = await getPopularMoviesUsecase.call(rand);

    // if (isRefreshing == true) {
    //   _movies = fetchedMoviesList.map((movie) => MovieViewModel(movie: movie)).toList();

    //   // To toggle back isRefreshing state to initial so as
    //   // not to always run this if statement block
    //   isRefreshing = false;

    //   notifyListeners();
    // }

    // _movies
    //     .addAll(fetchedMoviesList.map((movie) => MovieViewModel(movie: movie)).toList());

    notifyListeners();
    return _movies;
  }
}
