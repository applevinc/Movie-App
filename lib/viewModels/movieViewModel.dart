import 'package:movie_app/domain/movie.dart';
import 'package:movie_app/service/movieService.dart';

class MovieViewModel {
  Movie _movie;

  MovieViewModel({Movie movie}) {
    this._movie = movie;
  }

  int get id => _movie.id;
  String get title => _movie.title;
  String get description => _movie.description;
  String get poster => 'https://image.tmdb.org/t/p/w500${_movie.poster}';
  double get rating => _movie.rating;
  String get genre => getMovieGenre();
  String get releasedDate => _movie.releaseDate;

  String getMovieGenre() {
    var movieGenreIds = _movie.genre;

    List genreList = [];

    for (int id in movieGenreIds) {
      for (var genreItem in tmbdGenreList) {
        if (id == genreItem.id) {
          genreList.add(genreItem.name);
        }
      }
    }

    String genre = genreList.join(', ');

    return genre;
  }
}
