import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fontSize = 30,
    this.textColor = const Color.fromARGB(255, 2, 96, 12),
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
