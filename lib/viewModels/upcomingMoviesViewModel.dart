import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:movie_app/dataSource/api.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

class UpcomingMoviesViewModel extends ChangeNotifier {
  Api _api = Api();
  List<MovieViewModel> _movies = [];

  List<MovieViewModel> get movies => _movies;

  Future<List<Movie>> getUpcomingMovies() async {
    //Generate random page number
    Random random = new Random();
    final int pageNumber = random.nextInt(10);

    List<Movie> fetchedMoviesList = await _api.fetchUpcomingMovies(pageNumber);

    _movies = fetchedMoviesList.map((movie) => MovieViewModel(movie: movie)).toList();

    notifyListeners();
    return fetchedMoviesList;
  }
}
