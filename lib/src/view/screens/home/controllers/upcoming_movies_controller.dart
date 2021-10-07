import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/usecases/fetch_upcoming_movies_usecase.dart';

class GetUpcomingMoviesController extends ChangeNotifier {
  final GetUpComingMoviesUsecase upComingMoviesUsecase;
  GetUpcomingMoviesController(this.upComingMoviesUsecase);

  bool isRefreshing = false;

  List<MovieEntity> _movies = [];
  List<MovieEntity> get movies => _movies;

  Future<List<MovieEntity>> getUpcomingMovies() async {
    Random random = Random();
    int rand = random.nextInt(14);
    if (rand == 0) {
      rand = 1;
    }

    if (_movies.isNotEmpty) {
      List<MovieEntity> fetchedMovies = await upComingMoviesUsecase.call(rand);
      _movies = _movies + fetchedMovies;

      notifyListeners();
    } else {
      _movies = await upComingMoviesUsecase.call(rand);
      notifyListeners();
    }

    notifyListeners();
    return _movies;
  }
}
