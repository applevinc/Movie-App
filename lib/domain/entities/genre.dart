class Genre {
  final int id;
  final String name;

  Genre({
    this.name,
    this.id,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}
