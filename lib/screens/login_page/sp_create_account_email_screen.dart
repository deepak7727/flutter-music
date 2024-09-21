import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_page/widget/sp_create_account_primary_button.dart';
import 'package:flutter_application_1/screens/login_page/widget/sp_create_account_textfield_widget.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/global/enum_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpCreateAccountEmailScreen extends StatefulWidget {
  const SpCreateAccountEmailScreen({super.key});

  @override
  State<SpCreateAccountEmailScreen> createState() =>
      _SpCreateAccountEmailScreenState();
}

class _SpCreateAccountEmailScreenState
    extends State<SpCreateAccountEmailScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final ValueNotifier<int> step = ValueNotifier<int>(1);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.spotifyBlackColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 25.h,
          ),
          child: Column(
            children: [
              /// custome app bar
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: ColorRes.spotifyBlackColor,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorRes.white.withOpacity(0.7),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: Styles.textstyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // enter email Section
              if (step.value == 1)
                SpCreateAccountTextfieldWidget(
                  controller: emailController,
                  textfieldTitle: "What's is your email?",
                  textfieldsubinfo: "You'll need to confirm  this emali later.",
                ),
              if (step.value == 2)
                SpCreateAccountTextfieldWidget(
                  controller: passwordController,
                  textfieldTitle: "Create a password",
                  textfieldsubinfo: "use atleast 8 characters",
                ),
              if (step.value == 3) ...[
                SpCreateAccountTextfieldWidget(
                  controller: genderController,
                  textfieldTitle: "what is your Gender?",
                  isDropDownMenu: true,
                  listofDropDown: [
                    "Option one",
                    "option two",
                  ],
                ),
              ],
              SizedBox(height: 20.h),
              SpCreateAccountPrimaryButton(
                buttonName: "Next",
                onTap: () {
                  if (emailController.text.isNotEmpty) {
                    step.value = 2;
                    setState(() {});
                    emailController.clear();
                  } else if (passwordController.text.isNotEmpty) {
                    step.value = 3;
                    setState(() {});
                    passwordController.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
