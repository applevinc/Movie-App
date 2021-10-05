import 'package:movie_app/src/domain/entities/trailer.dart';

class TrailerModel extends TrailerEntity{
  final String name;
  final String id;

  TrailerModel({
    this.name,
    this.id,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      name: json['name'],
      id: json['key'],
    );
  }
}
