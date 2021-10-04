
class Movie {
  final int id;
  final String title;
  final String poster;
  final String description;
  final String releaseDate;
  final List<int> genre;
  final double rating;

  Movie({
    this.id,
    this.title,
    this.poster,
    this.description,
    this.releaseDate,
    this.genre,
    this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      title: json['title'],
      poster: json["poster_path"],
      description: json["overview"],
      releaseDate: json["release_date"],

      /*
      List.from() constructor creates a new list
      json['genre_ids'] is a list of ints from the json data
      .map((an element in genre_ids list) => returns the element)
      */
      genre: List<int>.from(json["genre_ids"].map((x) => x)),
      rating: json["vote_average"].toDouble(),
    );
  }
}
