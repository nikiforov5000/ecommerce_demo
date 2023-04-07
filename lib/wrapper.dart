import 'package:ecommerce_demo/models/local_user.dart';
import 'package:ecommerce_demo/screens/categories_screen/categories_screen.dart';
import 'package:ecommerce_demo/screens/login/login_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static String id = '/wrapper';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<LocalUser?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<LocalUser?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final LocalUser? user = snapshot.data;
          if (user == null) {
            print('wrapper.dart -> user is NULL');
            return LoginScreen();
          }
          else {
            print('wrapper.dart -> user is ${user.email}');
            return CategoriesScreen();
          }
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
