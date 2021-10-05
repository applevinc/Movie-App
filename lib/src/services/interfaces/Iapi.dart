import 'package:movie_app/src/domain/entities/cast.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/entities/trailer.dart';

abstract class IApi {
  Future<List<MovieEntity>> fetchPopularMovies(int page);
  Future<List<MovieEntity>> fetchUpcomingMovies(int page);
  void fetchGenreList();
  Future<List<CastEntity>> fetchMovieCasts(int movieId);
  Future<List<TrailerEntity>> fetchMovieTrailerVideos(int movieId);
  Future<List<MovieEntity>> fetchMovieSearchResults(String query);
}