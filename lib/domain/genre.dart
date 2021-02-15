class Genre {
  final String name;
  final int id;

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
