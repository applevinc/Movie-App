import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie.dart';
import 'package:movie_app/service/movieService.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

import 'dart:math';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class MovieListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<MovieViewModel> popularMoviesList = List<MovieViewModel>();
  List<MovieViewModel> upcomingMoviesList = List<MovieViewModel>();

  Future<List<Movie>> popularMovies() async {
    //Generate random page number
    Random random = new Random();
    final int randomNumber = random.nextInt(100);

    //fetch movies from the page
    List<Movie> movies = await MovieService.fetchPopularMovies(randomNumber);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.popularMoviesList = movies.map((movie) => MovieViewModel(movie: movie)).toList();

    if (this.popularMoviesList.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();

    return movies;
  }

  Future<List<Movie>> upcomingMovies() async {
    //Generate random page number
    Random random = new Random();
    int randomNumber = random.nextInt(10);

    //fetch movies from the page
    List<Movie> movies = await MovieService.fetchUpcomingMovies(randomNumber);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.upcomingMoviesList = movies.map((movie) => MovieViewModel(movie: movie)).toList();

    if (this.upcomingMoviesList.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();

    return movies;
  }
}
