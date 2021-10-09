import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/usecases/fetch_upcoming_movies_usecase.dart';
import 'package:movie_app/src/view/screens/home/controllers/helpers.dart';

class GetUpcomingMoviesController extends ChangeNotifier {
  RefreshStatus refreshStatus = RefreshStatus.static;

  final GetUpComingMoviesUsecase upComingMoviesUsecase;
  GetUpcomingMoviesController(this.upComingMoviesUsecase);

  List<MovieEntity> _movies = [];
  List<MovieEntity> get movies => _movies;

  Future<List<MovieEntity>> getMovies() async {
    int rand = generateRandomInt();

    if (_movies.isNotEmpty && refreshStatus == RefreshStatus.static) {
      List<MovieEntity> fetchedMovies = await upComingMoviesUsecase.call(rand);
      _movies = _movies + fetchedMovies;
      notifyListeners();
    } else if (refreshStatus == RefreshStatus.refreshing) {
      _movies = await upComingMoviesUsecase.call(rand);
      notifyListeners();
    } else {
      _movies = await upComingMoviesUsecase.call(rand);
      notifyListeners();
    }

    return _movies;
  }

   void isRefreshing() {
    refreshStatus = RefreshStatus.refreshing;
    notifyListeners();
  }

  int generateRandomInt() {
    Random random = Random();
    int rand = random.nextInt(14);
    if (rand == 0) {
      rand = 1;
    }
    return rand;
  }
}
