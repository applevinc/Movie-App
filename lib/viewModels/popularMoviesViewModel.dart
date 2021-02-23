import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:movie_app/dataSource/api.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

class PopularMoviesViewModel extends ChangeNotifier {
  Api _api = Api();
  List<MovieViewModel> _movies = [];

  List<MovieViewModel> get movies => _movies;

  Future<List<Movie>> getPopularMovies() async {
    //Generate random page number
    Random random = new Random();
    final int pageNumber = random.nextInt(100);

    List<Movie> fetchedMoviesList = await _api.fetchPopularMovies(pageNumber);
    _movies = fetchedMoviesList.map((movie) => MovieViewModel(movie: movie)).toList();

    notifyListeners();
    return fetchedMoviesList;
  }
}
