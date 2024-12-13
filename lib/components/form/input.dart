import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType keyboardType;
  final bool focus;
  final TextStyle inputStyle;
  final Function(String)? onChanged;

  const InputBox({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: TextField(
        style: inputStyle,
        autofocus: focus,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: TailwindColors.gray50,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: TailwindColors.gray900,
            fontSize: 12,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: TailwindColors.gray400,
            fontSize: 12,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hoverColor: TailwindColors.gray100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: TailwindColors.gray300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: TailwindColors.gray200),
          ),
        ),
      ),
    );
  }
}
