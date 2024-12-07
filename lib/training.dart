class Training {
  final int? id;
  final String title;
  final String institution;
  final String year;
  final String description;

  Training({
    this.id,
    required this.title,
    required this.institution,
    required this.year,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'institution': institution,
      'year': year,
      'description': description,
    };
  }
}
