import 'package:ecommerce_demo/main.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:ecommerce_demo/screens/welcome_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class Wrapper extends StatelessWidget {
  static String id = '/wrapper';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot){
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? WelcomeScreen() : EcommerceDemoApp();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },

    );
  }
}
