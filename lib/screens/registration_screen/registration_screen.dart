import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/login/login_text_field.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/register_alert_dialog.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/register_button.dart';
import 'package:ecommerce_demo/screens/welcome_screen/widgets/logo.dart';
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
              LoginTextField(label: 'Email', controller: emailController,),
              SizedBox(height: 8.0),
              LoginTextField(label: 'Password', controller: passwordController,),
              SizedBox(height: 8.0),
              LoginTextField(label: 'Repeat password', controller: repeatPasswordController,),
              RegisterButton(
                emailController: emailController,
                passwordController: passwordController,
                repeatPasswordController: repeatPasswordController,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
