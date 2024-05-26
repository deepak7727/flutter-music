import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  IconData? icon;

  ButtonWidget({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // title
          Text(title),

          //icon
          (icon != null) ? Icon(icon) : Container(),
        ],
      ),
    );
  }
}
