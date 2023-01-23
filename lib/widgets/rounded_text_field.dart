import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {

  final void Function(String) onChange;

  final Color color;
  final String placeholder;

  const RoundedTextField({
    Key? key,
    required this.placeholder,
    required this.color,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: isPassword() ? true : false,
      textAlign: TextAlign.center,
      onChanged: (value) {
        onChange(value);
      },
    );
  }

  isPassword() {
    return placeholder.split(' ').last == 'password';
  }

  isEmail() {
    return placeholder.split(' ').last == 'email';
  }
}
