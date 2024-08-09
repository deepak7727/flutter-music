import 'package:flutter/material.dart';

class ModernTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;

  ModernTextFieldWidget({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.blue) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: Colors.blue),
                onPressed: () {
                  controller.clear();
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
