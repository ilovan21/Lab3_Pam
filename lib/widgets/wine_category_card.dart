import 'package:flutter/material.dart';
import '../models/wine_category.dart';

class WineCategoryCard extends StatelessWidget {
  final WineCategory category;

  const WineCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(category.imageUrl, height: 120, width: 160, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(category.category, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
