import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return CircleAvatar(
      child: GestureDetector(
        onTap: () {
          authService.signOut();
          print('tapped logout');
          Navigator.popAndPushNamed(context, Wrapper.id);
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}