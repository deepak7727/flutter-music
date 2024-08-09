import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/utils/custome_button_widget.dart';
import 'package:flutter_application_1/utils/glasseffect_widget.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_application_1/utils/gradient_button.dart';
import 'package:flutter_application_1/utils/image_collections.dart';
import 'package:flutter_application_1/utils/inert_color_text_widget.dart';
import 'package:flutter_application_1/utils/modern_textfield_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: (kDebugMode) ? "A" : " ");
  TextEditingController passwordController =
      TextEditingController(text: (kDebugMode) ? "A" : " ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageCollections.bg_loginImage,
            fit: BoxFit.fitHeight,
            height: double.maxFinite,
          ),
          Center(
            child: GlassEffectWidget(
              height: 400.h,
              width: 350.w,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InvertedColorText(
                          backgroundColor: ColorList.white, text: "Login Page"),
                      SizedBox(height: 20.h),
                      ModernTextFieldWidget(
                        controller: emailController,
                        hintText: "Enter Email",
                        prefixIcon: Icons.email_outlined,
                      ),
                      SizedBox(height: 10.h),
                      ModernTextFieldWidget(
                        controller: passwordController,
                        hintText: "Enter Password",
                        prefixIcon: Icons.key_rounded,
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomSquareButton(
                              text: "Login",
                              textColor: ColorList.white,
                              buttonColor: Colors.green,
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RouteUtils.home, (route) => false);

                                if (emailController.text == "A" &&
                                    passwordController.text == "A") {
                                } else {
                                  print(
                                      "*************** ${emailController.text} : ${passwordController.text} *************");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      GradientButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteUtils.signup);
                        },
                        text: "Sign up",
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFBDA785),
                            ColorList.tileBackgroundColor,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
