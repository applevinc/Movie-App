class Cast {
  final String name;
  final String image;

  Cast({
    this.name,
    this.image,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'],
      image: 'https://image.tmdb.org/t/p${json['profile_path']}',
    );
  }
}
