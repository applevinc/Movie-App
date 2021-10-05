import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/usecases/fetch_upcoming_movies_usecase.dart';

class GetUpcomingMoviesController extends ChangeNotifier {
  final GetUpComingMoviesUsecase upComingMoviesUsecase;
  GetUpcomingMoviesController(this.upComingMoviesUsecase);

  bool isRefreshing = false;

  List<MovieEntity> _movies;
  List<MovieEntity> get movies => _movies;

  Future<List<MovieEntity>> getUpcomingMovies() async {
    Random random = Random();
    int rand = random.nextInt(14);
    if (rand == 0) {
      rand = 1;
    }

    _movies = await upComingMoviesUsecase.call(rand);

    // List<MovieEntity> fetchedMoviesList = await upComingMoviesUsecase.call(rand);

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
