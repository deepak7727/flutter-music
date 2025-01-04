import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global/global_res.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Globals.instance.getUserDetails();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () async {
        if (Globals.instance.emailUser.value != null ||
            Globals.instance.goolgeUser.value != null) {
          Get.offAllNamed(RouteUtils.home);
        } else {
          Get.offAllNamed(RouteUtils.login);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          ImageRes.lottieSplash,
          height: 100,
        ),
      ),
    );
  }
}
