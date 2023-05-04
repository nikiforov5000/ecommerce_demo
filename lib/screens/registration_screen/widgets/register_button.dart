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
          if (passwordController.text !=
              repeatPasswordController.text) {
            showDialog(
              context: context,
              builder: (context) {
                return showAlertDialogWithMessage(
                    context, 'Please check passwords');
              },
            );
            return;
          }
          else {
            LocalUser? user =
            await authService.createUserWithEmailAndPassword(
              emailController.text,
              passwordController.text,
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
