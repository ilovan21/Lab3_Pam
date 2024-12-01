import 'dart:convert';

class Wine {
  final String name;
  final String type;
  final String price;
  final String criticsScore;
  final String availability;
  final String imageUrl;

  Wine({
    required this.name,
    required this.type,
    required this.price,
    required this.criticsScore,
    required this.availability,
    required this.imageUrl,
  });

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'],
      type: json['type'],
      price: json['price'],
      criticsScore: json['criticsScore'],
      availability: json['availability'],
      imageUrl: json['imageUrl'],
    );
  }
}
