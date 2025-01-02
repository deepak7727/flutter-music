import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/authtication/authtication_cubit.dart';
import 'package:flutter_application_1/cubit/authtication/authtication_state.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/loading_page/loading_screen.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_application_1/utils/common/custome_button_widget.dart';
import 'package:flutter_application_1/utils/common/glasseffect_widget.dart';
import 'package:flutter_application_1/utils/common/inert_color_text_widget.dart';
import 'package:flutter_application_1/utils/common/modern_textfield_widget.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_application_1/utils/global/route_utils.dart';
import 'package:flutter_application_1/utils/common/gradient_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: (kDebugMode) ? "deepak@me.com" : "");
  TextEditingController passwordController =
      TextEditingController(text: (kDebugMode) ? "deepak@me" : "");
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthticationCubit, AuthticationState>(
        listener: (context, state) {
      if (state is AuthticationSucess) {
        showToast(title: state.message);
        // save  to local database
        Get.offAllNamed(RouteUtils.home);
      }
      if (state is AuthticationError) {
        showToast(title: state.message, isError: true);
      }
    }, builder: (context, state) {
      return Stack(
        children: [
          Scaffold(
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InvertedColorText(
                                  backgroundColor: ColorRes.white,
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
                              EvolvedButton(
                                text: "Login",
                                textColor: ColorRes.white,
                                buttonColor:
                                    const Color.fromRGBO(76, 175, 80, 1),
                                onPressed: () async {
                                  await loginButtonAction();
                                },
                              ),
                              SizedBox(height: 10.h),
                              EvolvedButton(
                                text: "Sign up",
                                textColor: ColorRes.white,
                                buttonColor: ColorRes.secondryColorsecond,
                                onPressed: () async {
                                  Get.toNamed(RouteUtils.signup);
                                },
                              ),
                              SizedBox(height: 10.h),
                              // InkWell(
                              //   onTap: () {
                              //     Get.offAllNamed(RouteUtils.home);
                              //   },
                              //   child: Icon(
                              //     Icons.home,
                              //   ),
                              // ),
                              EvolvedButton(
                                text: "Sign up",
                                textWidegt: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      size: 18.h,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "Go Home",
                                      style: Styles.textstyle(),
                                    ),
                                  ],
                                ),
                                textColor: ColorRes.white,
                                buttonColor: ColorRes.secondryColorsecond,
                                onPressed: () async {
                                  Get.toNamed(RouteUtils.signup);
                                },
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
          ),
          if (state is AuthticationLoading) const LoadingScreen()
        ],
      );
    });
  }

  Future<void> loginButtonAction() async {
    if (loginKey.currentState!.validate()) {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        if (await checkNetwork()) {
          print('aaa ********* Check Network ${await checkNetwork()}');
          BlocProvider.of<AuthticationCubit>(context).Login(
            user: UserModel(
              userEmail: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
        } else {
          showToast(
            title: "No Internt Connection",
            isError: true,
          );
        }
      }
    } else {
      showToast(
          title: "Please Enter Values", message: "Enter email or password");
    }
  }
}
