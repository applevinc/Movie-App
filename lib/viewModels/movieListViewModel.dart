import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie.dart';
import 'package:movie_app/service/movieService.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class MovieListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<MovieViewModel> movies = List<MovieViewModel>();

  Future<List<Movie>> newMovies() async {
    List<Movie> movies = await MovieService().fetchNewMovies();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.movies = movies.map((movie) => MovieViewModel(movie: movie)).toList();

    if (this.movies.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();

    return movies;
  }
}
