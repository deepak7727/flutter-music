import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:flutter_application_1/styles/color_list.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_application_1/utils/common/custome_button_widget.dart';
import 'package:flutter_application_1/utils/common/glasseffect_widget.dart';
import 'package:flutter_application_1/utils/common/inert_color_text_widget.dart';
import 'package:flutter_application_1/utils/common/modern_textfield_widget.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_application_1/utils/common/gradient_button.dart';
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
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageRes.bg_loginImage,
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
                  child: Form(
                    key: loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InvertedColorText(
                            backgroundColor: ColorList.white,
                            text: "Login Page"),
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
                                buttonColor:
                                    const Color.fromRGBO(76, 175, 80, 1),
                                onPressed: () async {
                                  if (loginKey.currentState!.validate()) {
                                    if (emailController.text.isNotEmpty &&
                                        passwordController.text.isNotEmpty) {
                                      String? res = await FirebaseAuthService
                                          .instance
                                          .login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );

                                      debugPrintLocal(
                                          '****** res =  ${res} *****');
                                      if (res == "Success ") {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RouteUtils.home,
                                            (route) => false);
                                      }
                                    }
                                  } else {
                                    showToast(
                                        title: "login issue",
                                        message: "message message");
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
          ),
        ],
      ),
    );
  }
}
