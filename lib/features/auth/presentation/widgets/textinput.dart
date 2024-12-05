

import 'package:flutter/material.dart';
import 'package:saudi_plus/core/theme/app_color.dart';

class Textinput extends StatelessWidget {
  const Textinput({
    this.icon,
    this.hint,
    this.inputAction,
    this.inputType,
    this.controller,
    this.validator,
    this.obscureText,
    super.key,
  });
  final IconData? icon;
  final String? hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.black, // Set the color of the border
              width: 3.0, // Set the thickness of the border
            ),
          ),
        ),
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        keyboardType: inputType,
        textInputAction: inputAction,
        controller: controller,
        validator: validator,
        obscureText: obscureText ?? false,
      ),
    );
  }
}
