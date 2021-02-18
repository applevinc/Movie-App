import 'package:movie_app/domain/genre.dart';
import 'package:movie_app/domain/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Genre> tmbdGenreList = [];

class MovieService {
  static const String _apiKey = '925dbcf05f7687e206cd5743fac7bdff';

  static Future<List<Movie>> fetchPopularMovies(int page) async {
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
      throw Exception('Failed to load json data');
    }
  }

  static Future<List<Movie>> fetchUpcomingMovies(int page) async {
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
      throw Exception('Failed to load json data');
    }
  }

  void fetchGenreList() async {
    const String _url = 'https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey&language=en-US';
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final result = response.body;
      final data = jsonDecode(result)['genres'];

      final results = List<Map<String, dynamic>>.from(data);

      tmbdGenreList = results.map((genre) => Genre.fromJson(genre)).toList(growable: false);
    } else {
      throw Exception('Failed to load genre data');
    }
  }
}
