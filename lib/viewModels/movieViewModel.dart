import 'package:movie_app/domain/movie.dart';

class MovieViewModel {
  Movie _movie;

  MovieViewModel({Movie movie}) {
    this._movie = movie;
  }

  String get title => _movie.title;
  String get description => _movie.description;
  String get fullPosterUrl => _movie.poster[0];
  String get runtime => _movie.runTime;
  //double get rating => _movie.rating;
}
