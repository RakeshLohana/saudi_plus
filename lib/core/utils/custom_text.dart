import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final int? maxLines;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
    this.fontStyle,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
        fontStyle: fontStyle,
      ),
    );
  }
}
