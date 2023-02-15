import 'package:ecommerce_demo/main.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/buttonText.dart';
import '../widgets/rounded_button_widget.dart';
import '../widgets/rounded_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
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
                    child: Center(child: Text('eCommerce Demo app', textAlign: TextAlign.center, style: TextStyle(fontSize: 60, fontWeight: FontWeight.w100, color: Colors.blue),)),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedTextField(
                placeholder: 'Enter your email',
                color: Colors.blueAccent,
                onChange: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedTextField(
                placeholder: 'Enter your password',
                color: Colors.blueAccent,
                onChange: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                labelWidget: ButtonText(text: 'Register'),
                onTapCallback: () async {
                  print(email + ' ' + password);
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, EcommerceDemoApp.id);
                    }
                  }
                  catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
