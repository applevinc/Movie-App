import 'package:movie_app/dataSource/api.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

class SearchViewModel {
  Api _api = Api();
  List<MovieViewModel> _movies = [];

  List<MovieViewModel> get movies => _movies;

  Future<List<Movie>> getSearchResuts(String query) async {
    List<Movie> fetchedMoviesList = await _api.fetchMovieSearchResults(query);
    _movies = fetchedMoviesList.map((movie) => MovieViewModel(movie: movie)).toList();

    return fetchedMoviesList;
  }

  void clear(){
    _movies.clear();
  }
}
