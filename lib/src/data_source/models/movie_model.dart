import 'package:movie_app/src/data_source/models/genre_model.dart';
import 'package:movie_app/src/domain/entities/movie.dart';

class MovieModel extends MovieEntity {
  final int id;
  final String title;
  final String poster;
  final String description;
  final String releaseDate;
  final String genres;
  final double rating;

  MovieModel({
    this.id,
    this.title,
    this.poster,
    this.description,
    this.releaseDate,
    this.genres,
    this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json['title'],
      poster: 'https://image.tmdb.org/t/p/w500${json["poster_path"]}',
      description: json["overview"],
      releaseDate: json["release_date"],
      genres: generateGenre(json["genre_ids"]),
      rating: json["vote_average"].toDouble(),
    );
  }
}


