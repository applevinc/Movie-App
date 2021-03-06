import 'package:flutter/cupertino.dart';
import 'package:movie_app/data_source/api.dart';
import 'package:movie_app/domain/entities/video.dart';

class VideoViewModel extends ChangeNotifier {
  Api api = Api();
  List<Video> _trailers = [];

  Future<List<Video>> getTrailers(int movieId) async {
    _trailers = await api.fetchMovieTrailerVideos(movieId);

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
