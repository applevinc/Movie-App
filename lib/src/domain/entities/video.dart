class Video {
  final String name;
  final String id;

  Video({
    this.name,
    this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      name: json['name'],
      id: json['key'],
    );
  }
}
