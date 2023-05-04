import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/screens/login/login_screen.dart';
import 'package:ecommerce_demo/screens/registration_screen/registration_screen.dart';
import 'package:ecommerce_demo/screens/welcome_screen/widgets/head_line.dart';
import 'package:ecommerce_demo/screens/welcome_screen/widgets/logo.dart';
import 'package:ecommerce_demo/screens/welcome_screen/widgets/welcome_title.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Logo(),
              SizedBox(height: 50),
              WelcomeTitle(),
              HeadLine(),
              SizedBox(height: 50),
              Buttons(),
            ],
          ),
        ),
      ),
    );
  }
}




class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: RoundedButton(
            labelWidget: ButtonText(text: 'Login'),
            onTapCallback: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ),
        Expanded(
          child: RoundedButton(
            labelWidget: ButtonText(text: 'Register'),
            onTapCallback: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
          ),
        ),
      ],
    );
  }
}

