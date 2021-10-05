import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/usecases/fetch_movie_search_result_usecase.dart';

class MovieSearchResultsController {
  final GetMovieSearchResultUsecase searchResultUsecase;

  MovieSearchResultsController(this.searchResultUsecase);

  List<MovieEntity> _movies = [];
  List<MovieEntity> get movies => _movies;

  Future<List<MovieEntity>> getSearchResuts(String query) async {
    List<MovieEntity> fetchedMoviesList = await searchResultUsecase.call(query);
    //_movies = fetchedMoviesList.map((movie) => MovieViewModel(movie: movie)).toList();
    _movies = fetchedMoviesList;

    return fetchedMoviesList;
  }

  void clear() {
    _movies.clear();
  }
}
