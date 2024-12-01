import 'package:flutter/material.dart';
import '../models/wine.dart';

class WineCard extends StatelessWidget {
  final Wine wine;

  const WineCard({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Image.network(
                    wine.imageUrl,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(wine.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(wine.type),
                      Text('Critics\' Scores: ${wine.criticsScore}'),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(wine.price, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(wine.availability),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
