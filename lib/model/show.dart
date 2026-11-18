class Show {
  final int id;
  final String name;
  final double? rating;
  final List<String> genres;
  final String summary;
  final String image;

  Show({
    required this.id,
    required this.name,
    required this.rating,
    required this.genres,
    required this.summary,
    required this.image,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    final img = json['image'] as Map<String, dynamic>?;
    final raw = (json['summary'] ?? '') as String;
    return Show(
      id: json['id'],
      name: json['name'] ?? '-',
      rating: (json['rating']?['average'] as num?)?.toDouble(),
      genres: List<String>.from(json['genres'] ?? []),
      summary: raw.replaceAll(RegExp(r'<[^>]*>'), ''),
      image: img?['original'] ?? img?['medium'] ?? '',
    );
  }
}