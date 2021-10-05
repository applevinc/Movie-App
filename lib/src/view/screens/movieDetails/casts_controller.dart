import 'package:flutter/foundation.dart';
import 'package:movie_app/src/domain/entities/cast.dart';
import 'package:movie_app/src/domain/usecases/fetch_movie_cast_usecase.dart';

class CastController extends ChangeNotifier {
  final GetMovieCastUsecase getMovieCastUsecase;

  CastController( this.getMovieCastUsecase);

  List<CastEntity> _casts = [];
  List<CastEntity> get casts => _casts;

  Future<List<CastEntity>> getMovieCastsList(int movieId) async {
    _casts = await getMovieCastUsecase.call(movieId);

    notifyListeners();
    return _casts;
  }
}
