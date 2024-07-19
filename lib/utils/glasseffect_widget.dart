import 'dart:ui';

import 'package:flutter/material.dart';

class GlassEffectWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  GlassEffectWidget(
      {required this.width, required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            // Border and child widget
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
