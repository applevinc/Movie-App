import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/data_source/exceptions/fetch.dart';
import 'package:movie_app/src/data_source/models/cast_model.dart';
import 'package:movie_app/src/data_source/models/genre_model.dart';
import 'package:movie_app/src/data_source/models/movie_model.dart';
import 'package:movie_app/src/data_source/models/trailer_model.dart';
import 'package:dio/dio.dart';

abstract class IMovieRemoteDataSource {
  Future<List<MovieModel>> fetchPopularMovies(int pageNo);
  Future<List<MovieModel>> fetchUpcomingMovies(int pageNo);
  Future<List<CastModel>> fetchMovieCast(int movieId);
  Future<List<TrailerModel>> fetchMovieTrailer(int movieId);
  Future<List<MovieModel>> fetchMovieSearchResults(String query);
  Future<List<GenreModel>> fetchTmbdGenreList();
}

class MovieRemoteDataSourceImpl implements IMovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({@required this.dio});

  @override
  Future<List<MovieModel>> fetchPopularMovies(int pageNo) async {
    String _url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=$pageNo';

    try {
      final response = await dio.get(_url);
      final data = response.data['results'];

      // response data converted to a list
      final results = List<Map<String, dynamic>>.from(data);

      List<MovieModel> movies =
          results.map((movie) => MovieModel.fromJson(movie)).toList(growable: false);

      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  Future<List<MovieModel>> fetchUpcomingMovies(int pageNo) async {
    String _url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=$pageNo';

    try {
      final response = await dio.get(_url);
      final data = response.data['results'];

      // response data converted to a list
      final results = List<Map<String, dynamic>>.from(data);

      List<MovieModel> movies =
          results.map((movie) => MovieModel.fromJson(movie)).toList(growable: false);

      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  Future<List<CastModel>> fetchMovieCast(int movieId) async {
    String _url =
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey&language=en-US';

    try {
      final response = await dio.get(_url);
      final data = response.data['cast'];

      final results = List<Map<String, dynamic>>.from(data);

      List<CastModel> casts =
          results.map((cast) => CastModel.fromJson(cast)).toList(growable: false);

      return casts;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  Future<List<GenreModel>> fetchTmbdGenreList() async {
    const String _url =
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US';

    try {
      final response = await dio.get(_url);
      final data = response.data['genres'];
      final results = List<Map<String, dynamic>>.from(data);

      return results.map((genre) => GenreModel.fromJson(genre)).toList(growable: false);
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  Future<List<TrailerModel>> fetchMovieTrailer(int movieId) async {
    String _url =
        'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US';

    try {
      final response = await dio.get(_url);
      final data = response.data['results'];

      final results = List<Map<String, dynamic>>.from(data);

      List<TrailerModel> trailers =
          results.map((video) => TrailerModel.fromJson(video)).toList(growable: false);

      return trailers;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }

  @override
  Future<List<MovieModel>> fetchMovieSearchResults(String query) async {
    String _url =
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&query=$query&page=1&include_adult=false';

    try {
      final response = await dio.get(_url);
      final data = response.data['results'];
      final results = List<Map<String, dynamic>>.from(data);

      List<MovieModel> movies =
          results.map((movie) => MovieModel.fromJson(movie)).toList(growable: false);

      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }
}
