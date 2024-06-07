import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/button_widget.dart';
import 'package:flutter_application_1/utils/textfiled_widget.dart';

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Login Image
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50.0,
              ),
              child: Image.asset(
                "assest/images/login.png",
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
                    "Login page",
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
                    title: "Login",
                    icon: Icons.login,
                  ),

                  InkWell(onTap: (){
                    Navigator.pushNamed(context, '/signup');
                  },child: Text("signup"),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
