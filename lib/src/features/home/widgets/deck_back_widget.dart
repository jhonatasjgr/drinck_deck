import 'package:drinkdeck/src/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DeckBackWidget extends StatelessWidget {
  final AnimationController controller;
  final VoidCallback onTap;

  const DeckBackWidget({
    required Key key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  Widget _buildCardDecoration(BuildContext context,
      {required String cornerText}) {
    return Text(
      cornerText,
      style: const TextStyle(
        color: AppColors.gold,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.75,
        height: size.width * 0.75 * 1.4,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.darkBrown,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.gold, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 8,
              child: _buildCardDecoration(context, cornerText: 'D'),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Transform.rotate(
                angle: 3.14159,
                child: _buildCardDecoration(context, cornerText: 'D'),
              ),
            ),
            const Center(
              child: Text(
                'Toque para\nembaralhar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate(controller: controller)
        .shake(hz: 8, duration: 700.ms, rotation: 0.1);
  }
}
