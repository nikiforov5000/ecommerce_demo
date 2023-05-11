import 'package:ecommerce_demo/screens/registration_screen/utils.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    Key? key,
    required this.passwordController,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return RoundedButton(
      labelWidget: ButtonText(text: 'Log in'),
      onTapCallback: () async {
        final String email = emailController.text.trim();
        final String password = passwordController.text.trim();

        if (password.isEmpty || email.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarMessage.couldNotBeEmpty);
        } else if (!isValidEmail(email)) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarMessage.checkEmail);
        } else if (password.length < 6) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarMessage.checkPassLength);
        } else {
          print(
              'login_screen.dart -> Login button -> emailController.text: ${emailController.text}');
          try {
            final user = await authService.signInWithEmailAndPassword(
              emailController.text,
              passwordController.text,
            );
          } on FirebaseAuthException catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBarMessage.makeSnackBar(errorCodeToReadable(e.code)));
          }
        }
      },
    );
  }
}
