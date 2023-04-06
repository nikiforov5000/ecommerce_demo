import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/screens/registration_screen/registration_screen.dart';
import 'package:ecommerce_demo/screens/registration_screen/widgets/register_alert_dialog.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/services/user_provider.dart';
import 'package:ecommerce_demo/widgets/buttonText.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              SizedBox(height: 24.0),
              RoundedButton(
                labelWidget: ButtonText(text: 'Log in'),
                onTapCallback: () async {
                  await authService
                      .signInWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  )
                      .then((value) {
                    if (value == null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return showAlertDialogWithMessage(
                              context, 'Please check email and password');
                        },
                      );
                    } else {
                      userProvider.setUser = value;
                    }
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Or',
                  textAlign: TextAlign.center,
                  style: kButtonTextStyle,
                ),
              ),
              RoundedButton(
                labelWidget: ButtonText(text: 'Sign-in with Google'),
                onTapCallback: () async {
                  await authService
                      .signInWithGoogle()
                      .then((value) => userProvider.setUser = value!);
                },
              ),
              RoundedButton(
                labelWidget: ButtonText(text: 'Register'),
                onTapCallback: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
