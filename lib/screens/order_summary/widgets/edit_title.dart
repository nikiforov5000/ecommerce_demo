import 'package:flutter/material.dart';

class EditTitle extends StatelessWidget {
  const EditTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Edit',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.teal,
      ),
    );
  }
}
