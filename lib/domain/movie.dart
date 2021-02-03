class Movie {
  final String title;
  final List poster;
  final String description;
  final String runTime;
  //final double rating;

  Movie({
    this.title,
    this.poster,
    this.description,
    this.runTime,
    //this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      poster: json['imageurl'],
      description: json['synopsis'],
      runTime: json['runtime'],
      //rating: json['imdbrating'],
    );
  }
}
