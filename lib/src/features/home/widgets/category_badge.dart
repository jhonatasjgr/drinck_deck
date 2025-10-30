import 'package:drinkdeck/src/shared/constants.dart';
import 'package:flutter/material.dart';

class CategoryBadge extends StatelessWidget {
  final DeckItemCategory category;
  const CategoryBadge({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: category.displayColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category.displayName.toUpperCase(),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
