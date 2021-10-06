import 'package:movie_app/src/domain/entities/genre.dart';
import 'package:movie_app/src/domain/repositories/movie_repository.dart';

class GetGenreListUsecase {
  final IMovieRepository movieRepository;

  GetGenreListUsecase(this.movieRepository);

  Future<List<GenreEntity>> call() async {
    return await movieRepository.fetchTMBDGenreList();
  }
}