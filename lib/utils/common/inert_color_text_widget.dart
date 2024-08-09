import 'package:flutter/material.dart';

class InvertedColorText extends StatelessWidget {
  final Color backgroundColor;
  final String text;

  InvertedColorText({
    required this.backgroundColor,
    required this.text,
  });

  Color invertColor(Color color) {
    // Invert the color
    return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = invertColor(backgroundColor);

    return Container(
      padding: EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          children: text.split('').map((char) {
            return TextSpan(
              text: char,
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
