import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/textfiled_widget.dart';

import '../../utils/button_widget.dart';

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // signup
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50.0,
            ),
            child: Image.asset(
              "assest/images/signup.png",
              fit: BoxFit.cover,
            ),
          ),

          // Login Page
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Login
                Text(
                  "Signup page",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextfiledWidget(
                  controller: emailController,
                  title: "Enter Email",
                ),

                TextfiledWidget(
                  controller: passwordController,
                  title: "Enter Password",
                ),

                ButtonWidget(
                  title: "Signup",
                  icon: Icons.login,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
