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
            ImageCollections.bg_singupImage,
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
                    CustomSquareButton(
                      color: Colors.green,
                      onPressed: () {
                        // login method
                      },
                      text: "Signup",
                      textColor: ColorList.success,
                    ),
                    SizedBox(height: 10.h),
                    GradientButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouteUtils.login);
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
