import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final double rating;
  const RatingStar(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Color(0xFFFFC107), size: 18),
        const SizedBox(width: 4),
        Text(rating.toStringAsFixed(1)),
      ],
    );
  }
}