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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    InvertedColorText(backgroundColor: ColorList.white, text: "Login Page"),
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
                    CustomSquareButton(
                      color: Colors.green,
                      onPressed: () {
                        // login method
                      },
                      text: "Login",
                      textColor: ColorList.success,
                    ),
                    SizedBox(height: 10.h),
                    GradientButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteUtils.signup);
                      },
                      text: "Sign up",
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
