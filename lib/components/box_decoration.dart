import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color> gradientColors;
  final Alignment beginAlignment;
  final Alignment endAlignment;

  const GradientBackground({
    super.key,
    required this.child,
    this.gradientColors = const [
      TailwindColors.gray50, // Default start color
      TailwindColors.gray200, // Default end color
    ],
    this.beginAlignment = Alignment.topLeft,
    this.endAlignment = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: child, // The child widget passed into this component
    );
  }
}
