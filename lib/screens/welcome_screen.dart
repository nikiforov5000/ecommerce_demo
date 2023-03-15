import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../widgets/buttonText.dart';
import '../widgets/logo_hero.dart';
import '../widgets/rounded_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 0, 255),
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LogoHero(),
              RoundedButton(
                labelWidget: ButtonText(text: 'Login'),
                onTapCallback: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              SizedBox(height: 20.0),
              RoundedButton(
                labelWidget: ButtonText(text: 'Register'),
                onTapCallback: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
              SizedBox(height: 20.0),
              RoundedButton(
                labelWidget: ButtonText(text: 'Continue without account'),
                onTapCallback: () {
                  // Navigator.pushNamed(context, EcommerceDemoApp.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
