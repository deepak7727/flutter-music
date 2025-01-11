import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvolvedButton extends StatelessWidget {
  final String text;
  final Widget? textWidegt;
  final EdgeInsets? padding;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;

  EvolvedButton({
    required this.text,
    this.padding,
    this.textWidegt,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: IntrinsicHeight(
        child: Container(
          width: double.maxFinite,
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: buttonColor ?? ColorRes.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: textWidegt ??
              Text(
                text,
                textAlign: TextAlign.center,
                style: Styles.textStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}
