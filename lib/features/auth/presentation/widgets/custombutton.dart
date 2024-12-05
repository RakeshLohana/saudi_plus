import 'package:flutter/material.dart';

// Define the custom button widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // Callback when button is pressed
  final Color color;
  final Color textColor;
  final double elevation;
  final double radius;
  final EdgeInsetsGeometry padding;
  final double fontSize;

  // Constructor to accept parameters for customization
  const CustomButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue, // Default color
    this.textColor = Colors.white, // Default text color
    this.elevation = 5.0, // Default elevation
    this.radius = 30.0, // Default border radius
    this.padding = const EdgeInsets.symmetric(
        vertical: 15, horizontal: 30), // Default padding
    this.fontSize = 16.0, // Default font size
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Button press functionality
      style: ButtonStyle(
        backgroundColor:
        WidgetStateProperty.all(color), // Updated to WidgetStateProperty
        elevation: WidgetStateProperty.all(
            elevation), // Updated to WidgetStateProperty
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius), // Rounded corners
          ),
        ),
        padding: WidgetStateProperty.all(padding), // Padding of the button
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // Text color
          fontSize: fontSize, // Font size of the text
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
