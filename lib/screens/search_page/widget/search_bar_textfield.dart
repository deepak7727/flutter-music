import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';

class SearchBarTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final String hint;
  const SearchBarTextfield(
      {super.key,
      required this.controller,
      this.onChanged,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        hintStyle: Styles.textstyle(
            color: ColorRes.white.withOpacity(0.8), fontSize: 20),
      ),
      cursorColor: ColorRes.white,
      maxLines: 1,
      style: Styles.textstyle(color: ColorRes.white, fontSize: 20),
      onChanged: onChanged,
    );
  }
}
