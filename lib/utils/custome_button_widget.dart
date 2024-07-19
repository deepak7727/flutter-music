import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;

  CustomSquareButton({
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          iconColor: color,
          padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
          elevation: 5,
        ),
        child: Text(text, style: TextStyle(
            color: textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),),
      ),
    );
  }
}
