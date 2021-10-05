class MovieEntity {
  final int id;
  final String title;
  final String poster;
  final String description;
  final String releaseDate;
  final List<int> genre;
  final double rating;

  MovieEntity({
    this.id,
    this.title,
    this.poster,
    this.description,
    this.releaseDate,
    this.genre,
    this.rating,
  });
}
