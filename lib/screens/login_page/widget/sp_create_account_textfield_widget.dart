import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/global/enum_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpCreateAccountTextfieldWidget extends StatefulWidget {
  final String textfieldTitle;
  final String? Function(String?)? validator;
  final String? textfieldsubinfo;
  final TextEditingController controller;
  final bool isDropDownMenu;
  final List<Gender>? listofDropDown;
  final Function()? dropDownAction;

  const SpCreateAccountTextfieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    required this.textfieldTitle,
    this.isDropDownMenu = false,
    this.textfieldsubinfo,
    this.listofDropDown,
    this.dropDownAction,
  });

  @override
  State<SpCreateAccountTextfieldWidget> createState() =>
      _SpCreateAccountTextfieldWidgetState();
}

class _SpCreateAccountTextfieldWidgetState
    extends State<SpCreateAccountTextfieldWidget> {
  bool _isDropdownVisible = false;
  void Function()? _toggleDropdown() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Value-> ${_isDropdownVisible}"),
    ));
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
    return null;
  }

  void _selectOption(String option) {
    widget.controller.text = option;
    _toggleDropdown();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.textfieldTitle,
            style: Styles.textstyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.isDropDownMenu ? _toggleDropdown : null,
          child: TextFormField(
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            decoration: InputDecoration(
              fillColor: ColorRes.spotifyGreyColor,
              filled: true,
              enabled: !widget.isDropDownMenu,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            style: Styles.textstyle(
              fontSize: 18,
              color: ColorRes.white,
            ),
          ),
        ),
        if (_isDropdownVisible)
          Material(
            elevation: 4,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: widget.listofDropDown!.map((option) {
                return ListTile(
                  title: Text(option.name),
                  onTap: () {
                    _selectOption(option.name);
                  },
                );
              }).toList(),
            ),
          ),
        SizedBox(height: 3.h),
        if (widget.textfieldsubinfo != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.textfieldsubinfo!,
              style: Styles.textstyle(
                fontSize: 10,
              ),
            ),
          ),
        SizedBox(height: 35.h),
      ],
    );
  }
}
