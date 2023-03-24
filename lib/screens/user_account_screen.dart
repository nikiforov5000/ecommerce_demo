import 'package:ecommerce_demo/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAccountScreen extends StatelessWidget {
  static String id = 'user_account_screen';

  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _authService = Provider.of<AuthService>(context);
    // final _authUser = _authService.user.first.then((value) => value!.uid);
    final _userProvider = Provider.of<UserProvider>(context);
    final user = _userProvider.user;
    return Scaffold(
      body: user != null
          ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.uid),
                  Text(user.email),
                ],
              ),
          )
          : Text('user is null'),
    );
  }
}
