import 'package:movie_app/domain/entities/cast.dart';
import 'package:movie_app/domain/entities/genre.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/video.dart';
import 'package:movie_app/services/exceptions/fetch.dart';
import 'package:dio/dio.dart';

import 'package:movie_app/services/interfaces/Iapi.dart';
import 'package:movie_app/viewModels/movie_view_model.dart';

class Api implements IApi {
  static const String _apiKey = '925dbcf05f7687e206cd5743fac7bdff';

  @override
  Future<List<Movie>> fetchPopularMovies(int page) async {
    Dio dio = new Dio();
    String _url = 'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=$page';

    try {
      final response = await dio.get(_url);
      final data = response.data['results'];

      // response data converted to a list
      final results = List<Map<String, dynamic>>.from(data);

      List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).toList(growable: false);

      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  Future<List<Movie>> fetchUpcomingMovies(int page) async {
    Dio dio = new Dio();
    String _url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey&language=en-US&page=$page';

    try {
      final response = await dio.get(_url);
      final data = response.data['results'];

      // response data converted to a list
      final results = List<Map<String, dynamic>>.from(data);

      List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).toList(growable: false);

      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  Future<List<Cast>> fetchMovieCasts(int movieId) async {
    Dio dio = new Dio();
    String _url = 'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$_apiKey&language=en-US';

    try {
      final response = await dio.get(_url);
      final data = response.data['cast'];

      final results = List<Map<String, dynamic>>.from(data);

      List<Cast> casts = results.map((cast) => Cast.fromJson(cast)).toList(growable: false);

      return casts;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  void fetchGenreList() async {
    Dio dio = new Dio();
    const String _url = 'https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey&language=en-US';

    try {
      final response = await dio.get(_url);
      final data = response.data['genres'];
      final results = List<Map<String, dynamic>>.from(data);
      tmbdGenreList = results.map((genre) => Genre.fromJson(genre)).toList(growable: false);
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  Future<List<Video>> fetchMovieTrailerVideos(int movieId) async {
    Dio dio = new Dio();
    String _url = 'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$_apiKey&language=en-US';

    try {
      final response = await dio.get(_url);
      final data = response.data['results'];

      final results = List<Map<String, dynamic>>.from(data);

      List<Video> trailers = results.map((video) => Video.fromJson(video)).toList(growable: false);

      return trailers;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  Future<List<Movie>> fetchMovieSearchResults(String query) async {
    Dio dio = new Dio();
    String _url =
        'https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&language=en-US&query=$query&page=1&include_adult=false';

    try {
      final response = await dio.get(_url);
      final data = response.data['results'];
      final results = List<Map<String, dynamic>>.from(data);

      List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).toList(growable: false);

      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }
}
