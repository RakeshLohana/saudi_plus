import 'package:flutter/material.dart';


/// A highly customized Elevated Button widget
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double elevation;
  final double horizontalPadding;
  final double verticalPadding;
  final double width;
  final double height;
  final double textSize;
  final FontWeight? fontWeight;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 10.0,
    this.elevation = 5.0,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.width=double.infinity,
    this.height=50,
    this.textSize=16,
    this.fontWeight=FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ,
      height:height ,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,

          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor),
              const SizedBox(width: 8), // Spacing between icon and text
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: fontWeight,
                color: textColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
