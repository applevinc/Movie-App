import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/repositories/movie_repository.dart';

class GetMovieSearchResultUsecase {
  final IMovieRepository movieRepository;

  GetMovieSearchResultUsecase(this.movieRepository);

  Future<List<MovieEntity>> call(String query) async {
    return await movieRepository.fetchMovieSearchResults(query);
  }
}