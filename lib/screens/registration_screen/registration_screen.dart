import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/shoppint_cart/shopping_cart.dart';
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

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userProvider = Provider.of<LocalUserProvider>(context);
    final _shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Center(
                      child: Text(
                        'eCommerce Demo app',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w100,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.0),
              TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter email'),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: passwordController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter password'),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: repeatPasswordController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Re-enter password'),
              ),
              SizedBox(height: 24.0),
              RoundedButton(
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
                      DocumentReference cartRef = await ShoppingCart.createShoppingCart(user!.uid);
                      UserAccount.createFirestoreUserAccount(user, cartRef);
                      _shoppingCartProvider.shoppingCart = ShoppingCart(id: cartRef.id);


                      Navigator.pop(context);
                    }
                  }
              ),
              // RoundedButton(
              //   labelWidget: ButtonText(text: 'Sign-in with Google'),
              //   onTapCallback: () async {
              //     await authService.signInWithGoogle();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
