import 'package:movie_app/src/domain/entities/cast.dart';
import 'package:movie_app/src/domain/entities/genre.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/entities/trailer.dart';

abstract class IMovieRepository {
  Future<List<MovieEntity>> fetchPopularMovies(int pageNo);
  Future<List<MovieEntity>> fetchUpcomingMovies(int pageNo);
  Future<List<CastEntity>> fetchMovieCast(int movieId);
  Future<List<TrailerEntity>> fetchMovieTrailer(int movieId);
  Future<List<MovieEntity>> fetchMovieSearchResults(String query);
  Future<List<GenreEntity>> fetchTMBDGenreList();
}
