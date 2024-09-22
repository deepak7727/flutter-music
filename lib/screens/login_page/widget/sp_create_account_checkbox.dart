import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';

class SpCreateAccountCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function()? onTap;
  const SpCreateAccountCheckbox({
    super.key,
    required this.isChecked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorRes.white, 
              width: 1.0,
            ),
            color:
                isChecked ? ColorRes.spotifyPrimaryColor : Colors.transparent, // Checkbox state color
          ),
          child: isChecked
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15.0,
                )
              : null, // Show the check mark when checked
        ),
      ),
    );
  }
}
