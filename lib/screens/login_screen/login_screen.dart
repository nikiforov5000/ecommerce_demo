import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/screens/login_screen/login_button.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/google_sign_in_button.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/login_text_field.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/or.dart';
import 'package:ecommerce_demo/screens/welcome_screen/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Logo(),
              LoginTextField(
                controller: emailController,
                label: 'Email',
              ),
              const SizedBox(height: 8.0),
              LoginTextField(
                isPassword: true,
                controller: passwordController,
                label: 'Password',
              ),
              const SizedBox(height: 24.0),
              LoginButton(
                passwordController: passwordController,
                emailController: emailController,
              ),
              const SizedBox(height: 8.0),
              OrDivider(),
              const SizedBox(height: 8.0),
              const GoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
