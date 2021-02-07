import 'package:movie_app/domain/movie.dart';

class MovieViewModel {
  Movie _movie;

  MovieViewModel({Movie movie}) {
    this._movie = movie;
  }

  int get id => _movie.id;
  String get title => _movie.title;
  String get description => _movie.description;
  String get poster => 'https://image.tmdb.org/t/p/w500${_movie.poster}';
  List get genre => _movie.genre;
  double get rating => _movie.rating;
}
