import 'package:ecommerce_demo/main.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/services/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../widgets/buttonText.dart';
import '../widgets/rounded_button_widget.dart';
import '../widgets/rounded_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late User loggedInUser;
  late String email;
  late String password;

  // var _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.purple,
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
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedTextField(
                  placeholder: 'Enter your email',
                  color: Colors.lightBlueAccent,
                  onChange: (value) {
                    setState(() {
                      email = value;
                    });
                  }),
              SizedBox(
                height: 8.0,
              ),
              RoundedTextField(
                  placeholder: 'Enter your password',
                  color: Colors.lightBlueAccent,
                  onChange: (value) {
                    setState(() {
                      password = value;
                    });
                  }),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                labelWidget: ButtonText(text: 'Log in'),
                onTapCallback: () async {
                  await authService.signInWithEmailAndPassword(
                    email,
                    password,
                  ).then((value) => userProvider.setUser = value!);
                },
              ),
              RoundedButton(
                labelWidget: ButtonText(text: 'Sign-in with Google'),
                onTapCallback: () async {
                  await authService.signInWithGoogle()
                      .then((value) => userProvider.setUser = value!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
