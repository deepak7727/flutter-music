import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpCreateAccountPrimaryButton extends StatelessWidget {
  final String buttonName;
  final Color? buttonColor;
  final Color? textButtonColor;
  final Function()? onTap;
  const SpCreateAccountPrimaryButton({
    super.key,
    required this.buttonName,
    this.onTap,
    this.buttonColor,
    this.textButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: buttonColor ?? ColorRes.spotifyGreyColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(
          buttonName,
          style: Styles.textstyle(
            fontSize: 18,
            color: textButtonColor ?? ColorRes.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
