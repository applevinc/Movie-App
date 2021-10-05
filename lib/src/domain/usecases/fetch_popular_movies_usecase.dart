import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/repositories/movie_repository.dart';

class GetPopularMoviesUsecase {
  final IMovieRepository movieRepository;

  GetPopularMoviesUsecase(this.movieRepository);

  Future<List<MovieEntity>> call(int pageNo) async {
    return await movieRepository.fetchPopularMovies(pageNo);
  }
}
