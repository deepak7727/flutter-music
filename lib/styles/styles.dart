import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static EdgeInsets standardPadding = EdgeInsets.symmetric(
    horizontal: 14.w,
    vertical: 14.h,
  );

  static EdgeInsets standardBoxPadding = EdgeInsets.all(5.w);

  static TextStyle textStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
    TextDecoration? decoration,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    return TextStyle(
      fontSize: (fontSize ?? 14).sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
    );
  }
}
