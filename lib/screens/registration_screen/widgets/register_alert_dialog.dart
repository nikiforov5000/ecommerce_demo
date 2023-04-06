import 'package:flutter/material.dart';

class RegisterAlertDialog extends StatelessWidget {
  const RegisterAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Password doesn\'t match',
          style: TextStyle(fontSize: 15),
        ),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        )
      ],
    );
  }
}