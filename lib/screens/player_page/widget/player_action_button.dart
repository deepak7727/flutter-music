import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerActionButton extends StatelessWidget {
  final String? buttonName;
  final IconData buttonIcon;
  final void Function()? action;

  const PlayerActionButton({
    super.key,
    this.buttonName = null,
    required this.buttonIcon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: action,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorRes.accentLightBlue,
              ),
              clipBehavior: Clip.hardEdge,
              child: Icon(
                buttonIcon,
                size: 30,
              ),
            ),
            if (buttonName != null) Text(buttonName!),
          ],
        ),
      ),
    );
  }
}
