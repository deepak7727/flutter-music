import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSquareButton extends StatelessWidget {
  final String text;
  final EdgeInsets? padding;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;

  CustomSquareButton({
    required this.text,
    this.padding,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        iconColor: buttonColor,
        backgroundColor: buttonColor,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
        elevation: 5,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
