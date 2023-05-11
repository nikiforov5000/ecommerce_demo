import 'package:ecommerce_demo/models/product_data.dart';
import 'package:flutter/material.dart';

String errorCodeToReadable(String code) {
  return code.replaceAll('-', ' ').capitalize();
}

bool isValidEmail(String email) {
  final RegExp emailRegex =
      RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
  return emailRegex.hasMatch(email);
}

class SnackBarMessage {
  static SnackBar checkEmail = makeSnackBar('Please check email');
  static SnackBar checkPassLength =
      makeSnackBar('Password could not be shorter than 6 char');
  static SnackBar passwordsDoNotMatch = makeSnackBar('Passwords should match');
  static SnackBar couldNotBeEmpty = makeSnackBar('Fields could not be empty');

  static SnackBar makeSnackBar(message) {
    return SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    );
  }
}
