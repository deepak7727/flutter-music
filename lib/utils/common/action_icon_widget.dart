import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionIconWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  const ActionIconWidget({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: Icon(
          Icons.search,
          size: 25.w,
        ),
      ),
    );
  }
}
