import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/domain/entities/trailer.dart';
import 'package:movie_app/src/domain/usecases/fetch_movie_trailer_usecase.dart';

class MovieTrailerController extends ChangeNotifier {
  final GetMovieTrailerUsecase trailerUsecase;
  MovieTrailerController(this.trailerUsecase);

  List<TrailerEntity> _trailers = [];

  Future<List<TrailerEntity>> getTrailers(int movieId) async {
    _trailers = await trailerUsecase.call(movieId);

    notifyListeners();
    return _trailers;
  }

  String getYouTubeId(int movieId) {
    String id;

    if (_trailers.isEmpty) {
      return null;
    } else {
      id = _trailers[0].id;
    }

    return id;
  }
}
