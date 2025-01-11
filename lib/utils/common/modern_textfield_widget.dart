import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/styles.dart';

class ModernTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChanged;
  final bool autofocus;

  ModernTextFieldWidget({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.borderRadius,
    this.suffixIcon,
    this.contentPadding,
    this.onChanged,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      autofocus: autofocus,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: Styles.textStyle(
          color: Colors.grey[600],
        ),
        contentPadding: contentPadding,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                color: Colors.black,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
