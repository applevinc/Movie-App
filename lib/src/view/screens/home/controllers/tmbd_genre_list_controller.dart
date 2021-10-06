import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/data_source/models/genre_model.dart';
import 'package:movie_app/src/domain/usecases/fetch_TMBD_genre_list_usecase.dart';

class GenreListController with ChangeNotifier {
  final GetGenreListUsecase _tmbdGenreListUsecase;

  GenreListController(this._tmbdGenreListUsecase);

  void fetchGenreList() async {
    genreList = await _tmbdGenreListUsecase.call();
  }
}
