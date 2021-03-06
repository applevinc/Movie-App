import 'package:movie_app/domain/entities/cast.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/video.dart';

abstract class IApi {
  Future<List<Movie>> fetchPopularMovies(int page);
  Future<List<Movie>> fetchUpcomingMovies(int page);
  void fetchGenreList();
  Future<List<Cast>> fetchMovieCasts(int movieId);
  Future<List<Video>> fetchMovieTrailerVideos(int movieId);
  Future<List<Movie>> fetchMovieSearchResults(String query);
}