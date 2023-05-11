import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/register_alert_dialog.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
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
    final userProvider = Provider.of<LocalUserProvider>(context);
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return RoundedButton(
        labelWidget: ButtonText(text: 'Register'),
        onTapCallback: () async {
          final String email = emailController.text.trim();
          final String password = passwordController.text.trim();
          final String repeatPassword = repeatPasswordController.text.trim();

          if (password.isEmpty || email.isEmpty || repeatPassword.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBarMessage.couldNotBeEmpty);
          }
          else if (!isValidEmail(email)) {
            print(email);
            ScaffoldMessenger.of(context).showSnackBar(SnackBarMessage.checkEmail);
          }
          else if (password.length < 6) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBarMessage.checkPassLength);
          }
          else if (password != repeatPassword) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBarMessage.passwordsDoNotMatch);
          }
          else {
            LocalUser? user =
            await authService.createUserWithEmailAndPassword(
              email,
              password,
            );
            userProvider.localUser = user;
            String cartId = await ShoppingCart.createShoppingCart(user!.uid);
            await UserAccount.createFirestoreUserAccount(user, cartId);
            shoppingCartProvider.shoppingCart = ShoppingCart(id: cartId);

            Navigator.pop;
          }
        }
    );
  }
}

bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
  return emailRegex.hasMatch(email);
}

class SnackBarMessage {
  static SnackBar checkEmail = makeSnackBar('Please check email');
  static SnackBar checkPassLength = makeSnackBar('Password could not be shorter than 6 char');
  static SnackBar passwordsDoNotMatch = makeSnackBar('Passwords should match');
  static SnackBar couldNotBeEmpty = makeSnackBar('Fields could not be empty');

  static SnackBar makeSnackBar(message) {
    return SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    );
  }
}

