import 'package:movie_app/src/domain/entities/cast.dart';
import 'package:movie_app/src/domain/repositories/movie_repository.dart';

class GetMovieCastUsecase {
  final IMovieRepository movieRepository;

  GetMovieCastUsecase(this.movieRepository);

  Future<List<CastEntity>> call(int movieId) async {
    return await movieRepository.fetchMovieCast(movieId);
  }
}