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