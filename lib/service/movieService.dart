import 'package:movie_app/domain/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieService {
  static const String _apiKey = '2b642b2840msh76cbf89a566d707p1aa631jsn4783d268eecf';
  static const String _url = 'https://ott-details.p.rapidapi.com/getnew?region=US&page=1';

  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "ott-details.p.rapidapi.com",
    "x-rapidapi-key": _apiKey,
  };

  Future<List<Movie>> fetchNewMovies() async {
    final response = await http.get(_url, headers: _headers);

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
}
