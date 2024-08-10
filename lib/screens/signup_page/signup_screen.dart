import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/utils/common/custome_button_widget.dart';
import 'package:flutter_application_1/utils/common/glasseffect_widget.dart';
import 'package:flutter_application_1/utils/common/inert_color_text_widget.dart';
import 'package:flutter_application_1/utils/common/modern_textfield_widget.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_application_1/utils/common/gradient_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageRes.bg_singupImage,
            fit: BoxFit.fitHeight,
            height: double.maxFinite,
          ),
          Positioned(
            left: 50.sw,
            top: 5.sh,
            child: ColoredBox(
              color: ColorList.white,
              child: SizedBox(
                height: 50,
                width: 50,
              ),
            ),
          ),
          Center(
            child: GlassEffectWidget(
              height: 380,
              width: 300,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 15.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InvertedColorText(
                        backgroundColor: ColorList.black, text: "Signup Page"),
                    SizedBox(height: 20.h),
                    ModernTextFieldWidget(
                      controller: emailController,
                      hintText: "Enter Email",
                    ),
                    SizedBox(height: 10.h),
                    ModernTextFieldWidget(
                      controller: passwordController,
                      hintText: "Enter Password",
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomSquareButton(
                            text: "Signup",
                            buttonColor: Colors.white,
                            textColor: ColorList.success,
                            onPressed: () {
                              // Register method
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                FirebaseAuthService.instance.registration(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    GradientButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteUtils.login,
                          (route) => false,
                        );
                      },
                      text: "Go Login",
                      gradient: LinearGradient(colors: [
                        Colors.black26,
                        Colors.black87,
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
