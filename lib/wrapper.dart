import 'package:ecommerce_demo/models/user.dart';
import 'package:ecommerce_demo/screens/login_screen.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static String id = '/wrapper';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;

          // return user == null ? LoginScreen() : ProductsListScreen();
          if (user == null) {
            print('Wrapper().build user is null');
            userProvider.setUserToNull();
            return LoginScreen();
          }
          else {
            userProvider.setUser = user;
            print('Wrapper().build user is NOT null');
            print(user.email);
            return ProductsListScreen();
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
