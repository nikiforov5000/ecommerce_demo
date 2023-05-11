import 'package:flutter/material.dart';


class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? isPassword;

  const LoginTextField({
    required this.label,
    required this.controller,
    this.isPassword,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                             Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          obscureText: isPassword ?? false,
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
          ),
        ),
      ),
    )    ;
  }
}

