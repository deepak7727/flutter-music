import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_page/widget/sp_login_button_widget.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpLoginScreen extends StatefulWidget {
  const SpLoginScreen({super.key});

  @override
  State<SpLoginScreen> createState() => _SpLoginScreenState();
}

class _SpLoginScreenState extends State<SpLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.spotifyBlackColor,
        body: Column(
          children: [
            Expanded(
              child: Image.asset(ImageRes.sploginBackgroundImage),
            ),
            Text(
              "Miliions of Songs.",
              style: Styles.textstyle(
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              "Free on Spotify.",
              style: Styles.textstyle(
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Column(
                children: [
                  /// sign up button
                  SpLoginButtonWidget(
                    buttonName: "Sign up free",
                    buttonColor: ColorRes.spotifyPrimaryColor,
                    textColor: ColorRes.spotifyBlackColor,
                    onTap: () {
                      Get.toNamed(RouteUtils.spCreateAccount);
                    },
                  ),
                  SizedBox(height: 12.h),
                  SpLoginButtonWidget(
                    buttonName: "Continue with Google",
                    svgImagePath: ImageRes.sploginGoogleIcon,
                  ),
                  SizedBox(height: 12.h),
                  SpLoginButtonWidget(
                    buttonName: "Continue with Facebook",
                    svgImagePath: ImageRes.sploginFacebookIcon,
                  ),
                  SizedBox(height: 12.h),
                  SpLoginButtonWidget(
                    buttonName: "Continue with Apple",
                    svgImagePath: ImageRes.sploginAppleIcon,
                    invertSvgImage: true,
                  ),
                  SizedBox(height: 12.h),
                  SpLoginButtonWidget(
                    buttonName: "Continue with Email",
                    svgImagePath: ImageRes.spEmailIcon,
                    invertSvgImage: true,
                    onTap: () {
                      Get.toNamed(RouteUtils.signup);
                    },
                  ),
                  SizedBox(height: 12.h),
                  SpLoginButtonWidget(
                    buttonName: "Log in",
                    borderColor: Colors.transparent,
                    onTap: () {
                      Get.toNamed(RouteUtils.login);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
