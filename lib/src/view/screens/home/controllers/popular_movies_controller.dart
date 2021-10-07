import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/usecases/fetch_popular_movies_usecase.dart';

enum RefreshStatus {
  refreshing,
  /// for [RefreshIndicator] widget is not active.
  static,
}

class GetPopularMoviesController extends ChangeNotifier {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  GetPopularMoviesController(this.getPopularMoviesUsecase);

  RefreshStatus refreshStatus = RefreshStatus.static;

  List<MovieEntity> _movies = [];
  List<MovieEntity> get movies => _movies;

  Future<List<MovieEntity>> getPopularMovies() async {
    int rand = _generateRandomInt();

    if (_movies.isNotEmpty && refreshStatus == RefreshStatus.static) {
      List<MovieEntity> fetchedMovies = await getPopularMoviesUsecase.call(rand);
      _movies = _movies + fetchedMovies;
      notifyListeners();
    } else if (refreshStatus == RefreshStatus.refreshing) {
      _movies = await getPopularMoviesUsecase.call(rand);
      notifyListeners();
    } else {
      _movies = await getPopularMoviesUsecase.call(rand);
      notifyListeners();
    }

    return _movies;
  }

  void isRefreshing() {
    refreshStatus = RefreshStatus.refreshing;
    notifyListeners();
  }

  int _generateRandomInt() {
    Random random = Random();
    int rand = random.nextInt(501);
    if (rand == 0) {
      rand = 1;
    }
    return rand;
  }
}
