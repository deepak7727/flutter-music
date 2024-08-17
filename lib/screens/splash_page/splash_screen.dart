import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global/global_res.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_application_1/utils/global/prefes_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () async {
        final flutterStorage = const FlutterSecureStorage();
        String? currentUser = await flutterStorage.read(
          key: PrefesRes.userInfo,
          aOptions: Globals.instance.getAndroidOptions(),
          iOptions: Globals.instance.getIOSOptions(),
        );

        if (currentUser != null) {
          Navigator.pushReplacementNamed(context, RouteUtils.home);
        } else {
          Navigator.pushReplacementNamed(context, RouteUtils.login);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageRes.logoImage,
          height: 100,
        ),
      ),
    );
  }
}
