import 'package:movie_app/src/domain/entities/genre.dart';
import 'package:movie_app/src/domain/entities/movie.dart';

List<GenreEntity> tmbdGenreList = [];

class MovieViewModel {
  MovieEntity _movie;

  MovieViewModel({MovieEntity movie}) {
    this._movie = movie;
  }

  int get id => _movie.id;
  String get title => _movie.title;
  String get description => (_movie.description != null) ? _movie.description : null;
  String get poster => 'https://image.tmdb.org/t/p/w500${_movie.poster}';
  double get rating => _movie.rating;
  String get genre => getMovieGenre();
  String get releasedDate => _movie.releaseDate;

  String getMovieGenre() {
    var movieGenreIds = _movie.genre;
    List movieGenreList = [];

    for (int id in movieGenreIds) {
      for (var genreItem in tmbdGenreList) {
        if (id == genreItem.id) {
          movieGenreList.add(genreItem.name);
        }
      }
    }

    String genre = movieGenreList.join(', ');

    return genre;
  }
}
