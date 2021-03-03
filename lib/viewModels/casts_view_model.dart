import 'package:flutter/foundation.dart';
import 'package:movie_app/data_source/api.dart';
import 'package:movie_app/domain/entities/cast.dart';

class CastsViewModel extends ChangeNotifier {
  Api _api = Api();
  List<Cast> _casts = [];

  List<Cast> get casts => _casts;

  Future<List<Cast>> getMovieCastsList(int movieId) async {
    _casts = await _api.fetchMovieCasts(movieId);

    notifyListeners();
    return _casts;
  }
}
