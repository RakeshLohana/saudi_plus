import 'package:flutter/material.dart';

class TouchableText extends StatelessWidget {
  final String text;
  final VoidCallback onTap; // Callback function when text is tapped
  final Color textColor; // Text color
  final Color underlineColor; // Underline color

  // Constructor to accept parameters
  const TouchableText({
    required this.text,
    required this.onTap,
    required this.textColor, // Pass text color
    required this.underlineColor, // Pass underline color
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger onTap callback when text is tapped
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // Text color
          decoration: TextDecoration.underline, // Apply underline decoration
          decorationColor: underlineColor,
          decorationThickness: 3, // Set underline color dynamically
          fontSize: 16, // Optional font size
          fontWeight: FontWeight.bold, // Optional font weight
        ),
      ),
    );
  }
}
