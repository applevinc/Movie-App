import 'package:movie_app/src/domain/entities/cast.dart';

class CastModel extends CastEntity {
  final String name;
  final String image;

  CastModel({
    this.name,
    this.image,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      image: 'https://image.tmdb.org/t/p/w500/${json['profile_path']}',
    );
  }
}