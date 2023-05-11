import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/google_sign_in_button.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/login_text_field.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/or.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/register_button.dart';
import 'package:ecommerce_demo/screens/welcome_screen/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

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
                label: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 8.0),
              LoginTextField(
                isPassword: true,
                label: 'Password',
                controller: passwordController,
              ),
              const SizedBox(height: 8.0),
              LoginTextField(
                isPassword: true,
                label: 'Repeat password',
                controller: repeatPasswordController,
              ),
              const SizedBox(height: 24.0),
              RegisterButton(
                emailController: emailController,
                passwordController: passwordController,
                repeatPasswordController: repeatPasswordController,
              ),
              // const SizedBox(height: 8.0),
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

