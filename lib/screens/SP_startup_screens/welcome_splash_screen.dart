import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/utils/global/global_res.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_application_1/utils/global/prefes_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class WelcomeSplashScreen extends StatefulWidget {
  const WelcomeSplashScreen({super.key});

  @override
  State<WelcomeSplashScreen> createState() => _WelcomeSplashScreenState();
}

class _WelcomeSplashScreenState extends State<WelcomeSplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () async {
        final flutterStorage = const FlutterSecureStorage();
        String? currentUser = await flutterStorage.read(
          key: PrefesRes.userInfo,
          aOptions: Globals.instance.getAndroidOptions(),
          iOptions: Globals.instance.getIOSOptions(),
        );

        if (currentUser != null) {
          Get.offAllNamed(RouteUtils.home);
        } else {
          Get.offAllNamed(RouteUtils.spLoginScreen);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.spotifyBlackColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: Image.asset(
            ImageRes.spSpotifyIcon,
            height: 150.h,
          ),
        ),
      ),
    );
  }
}
