import 'package:drinkdeck/src/features/home/widgets/category_badge.dart';
import 'package:drinkdeck/src/models/deck_item.dart';
import 'package:drinkdeck/src/shared/theme.dart';
import 'package:flutter/material.dart';

class DeckFrontWidget extends StatelessWidget {
  final DeckItem item;
  final VoidCallback onNext;
  final VoidCallback onShare;

  const DeckFrontWidget({
    required Key key,
    required this.item,
    required this.onNext,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.75,
      height: size.width * 0.75 * 1.4,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkBrown,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.offWhite, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                item.type.displayName.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              CategoryBadge(category: item.category),
            ],
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  item.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.share, color: AppColors.offWhite),
                onPressed: onShare,
              ),
              TextButton(
                onPressed: onNext,
                child: const Text('Outra carta',
                    style: TextStyle(color: AppColors.gold, fontSize: 16)),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border,
                    color: AppColors.offWhite),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
