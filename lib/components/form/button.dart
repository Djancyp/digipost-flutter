import 'package:digipost/components/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double elevation;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = TailwindColors.teal600, // Default background color
    this.textColor = Colors.white, // Default text color
    this.borderRadius = 8.0, // Default border radius
    this.padding = const EdgeInsets.symmetric(
        vertical: 12.0, horizontal: 24.0), // Default padding
    this.elevation = 2.0, // Default elevation
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        elevation: elevation,
      ),
      child: Text(text),
    );
  }
}
