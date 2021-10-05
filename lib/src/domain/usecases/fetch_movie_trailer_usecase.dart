import 'package:movie_app/src/domain/entities/trailer.dart';
import 'package:movie_app/src/domain/repositories/movie_repository.dart';

class GetMovieTrailerUsecase {
  final IMovieRepository movieRepository;

  GetMovieTrailerUsecase(this.movieRepository);

  Future<List<TrailerEntity>> call(int movieId) async {
    return await movieRepository.fetchMovieTrailer(movieId);
  }
}