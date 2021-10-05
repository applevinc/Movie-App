import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/repositories/movie_repository.dart';

class GetUpComingMoviesUsecase {
  final IMovieRepository movieRepository;

  GetUpComingMoviesUsecase(this.movieRepository);

  Future<List<MovieEntity>> call(int pageNo) async {
    return await movieRepository.fetchUpcomingMovies(pageNo);
  }
}