class WineCategory {
  final String criteria;
  final String category;
  final String imageUrl;

  WineCategory({
    required this.criteria,
    required this.category,
    required this.imageUrl,
  });

  factory WineCategory.fromJson(Map<String, dynamic> json) {
    return WineCategory(
      criteria: json['criteria'],
      category: json['category'],
      imageUrl: json['imageUrl'],
    );
  }
}
