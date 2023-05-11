import 'dart:io';

import 'package:ecommerce_demo/screens/registration_screen/utils.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return RoundedButton(
      labelWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset('assets/logo/google-logo.png'),
          ),
          Text('Google Sing-in'),
        ],
      ),
      onTapCallback: () async {
        if (kIsWeb) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarMessage.googleSigninNotAvailableOnWeb);
        }
        else {
          try {
            final user = await authService.signInWithGoogle();
          } on FirebaseAuthException catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBarMessage.makeSnackBar(errorCodeToReadable(e.code)));
          }
        }
      },
    );
  }
}
