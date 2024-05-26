import 'package:flutter/material.dart';

class TextfiledWidget extends StatefulWidget {
  String title;
  TextEditingController controller;
  TextfiledWidget({super.key, required this.title, required this.controller});

  @override
  State<TextfiledWidget> createState() => _TextfiledWidgetState();
}

class _TextfiledWidgetState extends State<TextfiledWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.title,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
