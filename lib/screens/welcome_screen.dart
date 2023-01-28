import 'package:ecommerce_demo/screens/login_screen.dart';
import 'package:ecommerce_demo/screens/registration_screen.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/logo_hero.dart';

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
                  text: 'Login',
                  color: Colors.blue,
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                  text: 'Register',
                  color: Colors.blue,
                  onPress: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}


