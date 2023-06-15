import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/registration_screen/utils.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  const RegisterButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.repeatPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return RoundedButton(
      labelWidget: ButtonText(text: 'Register'),
      onTapCallback: () async {
        final String email = emailController.text.trim();
        final String password = passwordController.text.trim();
        final String repeatPassword = repeatPasswordController.text.trim();

        if (password.isEmpty || email.isEmpty || repeatPassword.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarMessage.couldNotBeEmpty);
        } else if (!isValidEmail(email)) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarMessage.checkEmail);
        } else if (password.length < 6) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarMessage.checkPassLength);
        } else if (password != repeatPassword) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarMessage.passwordsDoNotMatch);
        } else {
          try {

            Navigator.pop;
          } on FirebaseAuthException catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBarMessage.makeSnackBar(errorCodeToReadable(e.code)));
          }
        }
      },
    );
  }
}
