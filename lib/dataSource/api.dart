import 'package:movie_app/domain/entities/cast.dart';
import 'package:movie_app/domain/entities/genre.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/domain/entities/video.dart';
import 'package:movie_app/services/exceptions/fetchExceptions.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:movie_app/services/interfaces/Iapi.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

class Api implements IApi {
  static const String _apiKey = '925dbcf05f7687e206cd5743fac7bdff';

  @override
  Future<List<Movie>> fetchPopularMovies(int page) async {
    String _url = 'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=$page';
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final result = response.body;
      final data = jsonDecode(result)['results'];

      // response data converted to a list
      final results = List<Map<String, dynamic>>.from(data);

      List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).toList(growable: false);

      return movies;
    } else {
      throw NetworkErrorException();
    }
  }

  @override
  Future<List<Movie>> fetchUpcomingMovies(int page) async {
    String _url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey&language=en-US&page=$page';
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final result = response.body;
      final data = jsonDecode(result)['results'];

      // response data converted to a list
      final results = List<Map<String, dynamic>>.from(data);

      List<Movie> movies = results.map((movie) => Movie.fromJson(movie)).toList(growable: false);

      return movies;
    } else {
      throw NetworkErrorException();
    }
  }

  @override
  Future<List<Cast>> fetchMovieCasts(int movieId) async {
    String _url = 'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$_apiKey&language=en-US';
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final result = response.body;
      final data = jsonDecode(result)['cast'];

      final results = List<Map<String, dynamic>>.from(data);

      List<Cast> casts = results.map((cast) => Cast.fromJson(cast)).toList(growable: false);

      return casts;
    } else {
      throw NetworkErrorException();
    }
  }

  @override
  void fetchGenreList() async {
    const String _url = 'https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey&language=en-US';
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final result = response.body;
      final data = jsonDecode(result)['genres'];

      final results = List<Map<String, dynamic>>.from(data);

      tmbdGenreList = results.map((genre) => Genre.fromJson(genre)).toList(growable: false);
    } else {
      throw NetworkErrorException();
    }
  }

  @override
  Future<List<Video>> fetchMovieTrailerVideos(int movieId) async {
    String _url = 'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$_apiKey&language=en-US';
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final result = response.body;
      final data = jsonDecode(result)['results'];

      final results = List<Map<String, dynamic>>.from(data);

      List<Video> trailers = results.map((video) => Video.fromJson(video)).toList(growable: false);

      return trailers;
    } else {
      throw NetworkErrorException();
    }
  }
}
