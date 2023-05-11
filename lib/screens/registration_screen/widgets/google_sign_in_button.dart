import 'package:ecommerce_demo/screens/registration_screen/utils.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return RoundedButton(
      labelWidget: Text('Google Sing-in'),
      onTapCallback: () async {
        try {
          final user = await authService.signInWithGoogle();
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBarMessage.makeSnackBar(errorCodeToReadable(e.code)));
        }
      },
    );
  }
}
