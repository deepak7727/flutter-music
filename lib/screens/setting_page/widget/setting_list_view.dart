import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingListView extends StatelessWidget {
  final IconData? settingIcon;
  final String settingName;
  final Function() settingAction;

  SettingListView({
    super.key,
    this.settingIcon,
    required this.settingAction,
    required this.settingName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: settingAction,
      child: Container(
        margin: EdgeInsets.all(10.w),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorList.lightBlueGrey,
        ),
        child: Row(
          children: [
            Icon(
              settingIcon ?? Icons.eco_rounded,
              size: 35.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              settingName,
              style: Styles.textstyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
