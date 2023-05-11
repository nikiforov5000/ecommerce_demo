import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/screens/login/login_text_field.dart';
import 'package:ecommerce_demo/screens/welcome_screen/widgets/logo.dart';
import 'package:ecommerce_demo/screens/welcome_screen/welcome_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Logo(),
              LoginTextField(
                controller: emailController,
                label: 'Email',
              ),
              SizedBox(height: 8.0),
              LoginTextField(
                isPassword: true,
                controller: passwordController,
                label: 'Password',
              ),
              SizedBox(height: 24.0),
              RoundedButton(
                labelWidget: ButtonText(text: 'Log in'),
                onTapCallback: () async {
                  print('login_screen.dart -> Login button -> emailController.text: ${emailController.text}');
                  final user = await authService
                      .signInWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
