class Project {
  final int? id;
  final String title;
  final String description;
  final String duration;
  final String link;

  Project({
    this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.link,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'link': link,
    };
  }
}
