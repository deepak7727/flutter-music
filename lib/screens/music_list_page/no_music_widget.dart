import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/image_collections.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoMusicWidget extends StatefulWidget {
  const NoMusicWidget({super.key});

  @override
  State<NoMusicWidget> createState() => _NoMusicWidgetState();
}

class _NoMusicWidgetState extends State<NoMusicWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Lottie.asset(
          ImageCollections.lottieEmptyList,
          height: 200.h,
        ),
      ),
    );
  }
}
