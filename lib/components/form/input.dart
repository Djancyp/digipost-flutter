import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType keyboardType;
  final bool focus;
  final TextStyle inputStyle;
  final Function(String)? onChanged;
  final String? Function(String?)? validator; // Added validator function

  const InputBox({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.inputStyle = const TextStyle(
      fontSize: 12,
      color: TailwindColors.gray900,
    ),
    this.focus = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator, // Added validator parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: TextFormField(
        style: inputStyle,
        autofocus: focus,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator, // Validation logic here
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: Colors.white70),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
