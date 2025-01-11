import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingSubItemView extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  final Function()? onTap;
  const SettingSubItemView(
      {super.key, required this.title, required this.titleIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: Styles.standardBoxPadding,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorRes.primaryColor,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              titleIcon,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
