import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/data_source/sources/remote_data_source.dart';
import 'package:movie_app/src/domain/entities/genre.dart';
import 'package:movie_app/src/domain/entities/trailer.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/entities/cast.dart';
import 'package:movie_app/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements IMovieRepository {
  final IMovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<List<CastEntity>> fetchMovieCast(int movieId) async {
    try {
      return await remoteDataSource.fetchMovieCast(movieId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieEntity>> fetchMovieSearchResults(String query) async {
    try {
      return await remoteDataSource.fetchMovieSearchResults(query);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TrailerEntity>> fetchMovieTrailer(int movieId) async {
    try {
      return await remoteDataSource.fetchMovieTrailer(movieId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieEntity>> fetchPopularMovies(int pageNo) async {
    try {
      return await remoteDataSource.fetchPopularMovies(pageNo);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieEntity>> fetchUpcomingMovies(int pageNo) async {
    try {
      return await remoteDataSource.fetchUpcomingMovies(pageNo);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<GenreEntity>> fetchTMBDGenreList() async {
    try {
      return await remoteDataSource.fetchTmbdGenreList();
    } catch (e) {
      rethrow;
    }
  }
}
