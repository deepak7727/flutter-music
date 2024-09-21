import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpLoginButtonWidget extends StatelessWidget {
  final String? imagePath;
  final String? svgImagePath;
  final bool? invertSvgImage;
  final String buttonName;
  final Function()? onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  const SpLoginButtonWidget({
    super.key,
    this.imagePath,
    this.svgImagePath,
    this.invertSvgImage,
    this.buttonColor,
    required this.buttonName,
    this.onTap,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: borderColor ?? ColorRes.white.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath ?? ImageRes.logoImage,
                height: 20.h,
              ),
            if (svgImagePath != null)
              SvgPicture.asset(
                svgImagePath!,
                height: 20.h,
                colorFilter: invertSvgImage == true
                    ? ColorFilter.matrix(
                        <double>[
                          -1, 0, 0, 0, 255, // Red
                          0, -1, 0, 0, 255, // Green
                          0, 0, -1, 0, 255, // Blue
                          0, 0, 0, 1, 0, // Alpha
                        ],
                      )
                    : null,
              ),
            Expanded(
              child: Center(
                child: Text(
                  buttonName,
                  style: Styles.textstyle(
                    color: textColor ?? ColorRes.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
