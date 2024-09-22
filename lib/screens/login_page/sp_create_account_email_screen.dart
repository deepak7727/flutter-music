import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_page/widget/sp_create_account_checkbox.dart';
import 'package:flutter_application_1/screens/login_page/widget/sp_create_account_primary_button.dart';
import 'package:flutter_application_1/screens/login_page/widget/sp_create_account_textfield_widget.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/common/validator.dart';
import 'package:flutter_application_1/utils/global/enum_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpCreateAccountEmailScreen extends StatefulWidget {
  const SpCreateAccountEmailScreen({super.key});

  @override
  State<SpCreateAccountEmailScreen> createState() =>
      _SpCreateAccountEmailScreenState();
}

class _SpCreateAccountEmailScreenState
    extends State<SpCreateAccountEmailScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final ValueNotifier<int> step = ValueNotifier<int>(1);

  bool isAgreeWithShareData = false;
  bool isAgreeWithGetNewsAndOffer = false;

  bool formValide() {
    if (step.value == 1) {
      if (emailController.text.isNotEmpty) {
        return true;
      }
    }
    if (step.value == 2) {
      if (passwordController.text.isNotEmpty) {
        return true;
      }
    }
    if (step.value == 3) {
      if (genderController.text.isNotEmpty) {
        return true;
      }
    }
    if (step.value == 4) {
      if (userNameController.text.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

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
                  InkWell(
                    onTap: () {
                      step.value > 1
                          ? setState(() {
                              step.value = --step.value;
                            })
                          : Get.back();
                    },
                    child: Container(
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

              Column(
                children: [
                  // enter email Section
                  if (step.value == 1)
                    SpCreateAccountTextfieldWidget(
                      controller: emailController,
                      validator: Validator.emailValidator,
                      textfieldTitle: "What's is your email?",
                      textfieldsubinfo:
                          "You'll need to confirm  this emali later.",
                    ),

                  // enter password section
                  if (step.value == 2)
                    SpCreateAccountTextfieldWidget(
                      controller: passwordController,
                      validator: Validator.passowrdValidator,
                      textfieldTitle: "Create a password",
                      textfieldsubinfo: "use atleast 8 characters",
                    ),

                  // enter Gender Section
                  if (step.value == 3) ...[
                    SpCreateAccountTextfieldWidget(
                      controller: genderController,
                      validator: Validator.genderValidator,
                      textfieldTitle: "what is your Gender?",
                      isDropDownMenu: true,
                      listofDropDown: [
                        Gender.Male,
                        Gender.Female,
                        Gender.Other,
                      ],
                    ),
                  ],

                  // enter username Section
                  if (step.value == 4) ...[
                    SpCreateAccountTextfieldWidget(
                      controller: userNameController,
                      validator: Validator.usernameValidator,
                      textfieldTitle: "what is your Name?",
                      textfieldsubinfo: "This appears on your spotify profile",
                    ),
                    Divider(),
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.w),
                              child: Text(
                                "By Tapping on \"Create Account\" , yous agree to spotify Terms of Use.",
                                style: Styles.textstyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.w),
                              child: Text(
                                "Term of Use",
                                style: Styles.textstyle(
                                  color: ColorRes.spotifyPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.w),
                              child: Text(
                                "To learn more about how spotify collect,use, share and protect your data, Please see Privacy Policy.",
                                style: Styles.textstyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.w),
                              child: Text(
                                "Privacy Policy",
                                style: Styles.textstyle(
                                  color: ColorRes.spotifyPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Pleas send me news and Offer from spotify",
                                    style: Styles.textstyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                SpCreateAccountCheckbox(
                                  isChecked: isAgreeWithGetNewsAndOffer,
                                  onTap: () {
                                    setState(() {
                                      isAgreeWithGetNewsAndOffer =
                                          !isAgreeWithGetNewsAndOffer;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Share My Registration data with spotify content provide for marketing purpose",
                                    style: Styles.textstyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                SpCreateAccountCheckbox(
                                  isChecked: isAgreeWithShareData,
                                  onTap: () {
                                    setState(() {
                                      isAgreeWithShareData =
                                          !isAgreeWithShareData;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Button
                  SizedBox(height: 20.h),
                  SpCreateAccountPrimaryButton(
                    buttonName: step.value == 4 ? "Create an account" : "Next",
                    buttonColor: formValide() ? ColorRes.white : null,
                    onTap: () {
                      if (emailController.text.isNotEmpty) {
                        setState(() {
                          step.value = 2;
                        });
                        emailController.clear();
                      } else if (passwordController.text.isNotEmpty) {
                        setState(() {
                          step.value = 3;
                        });
                        passwordController.clear();
                      } else if (genderController.text.isNotEmpty) {
                        setState(() {
                          step.value = 4;
                        });
                        genderController.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
