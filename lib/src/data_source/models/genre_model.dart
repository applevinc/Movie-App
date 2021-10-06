import 'package:movie_app/src/domain/entities/genre.dart';

class GenreModel extends GenreEntity {
  final int id;
  final String name;

  GenreModel({
    this.name,
    this.id,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

List<GenreEntity> genreList = [];

String generateGenre(dynamic genreIds) {
  List<String> movieGenreList = [];

  for (int id in genreIds) {
    for (var genreItem in genreList) {
      if (id == genreItem.id) {
        movieGenreList.add(genreItem.name);
      }
    }
  }

  return movieGenreList.join(', ');
}
