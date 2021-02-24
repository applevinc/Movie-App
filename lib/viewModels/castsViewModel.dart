import 'package:flutter/foundation.dart';
import 'package:movie_app/dataSource/api.dart';
import 'package:movie_app/domain/entities/cast.dart';

class CastsViewModel extends ChangeNotifier {
  Api _api = Api();
  List<Cast> _casts = [];

  List<Cast> get casts => _casts;

  void getMovieCastsList(int movieId) async {
    _casts = await _api.fetchMovieCasts(movieId);

    notifyListeners();
  }
}
