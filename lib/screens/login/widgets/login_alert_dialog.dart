import 'package:flutter/material.dart';

class LoginAlertDialog extends StatelessWidget {
  const LoginAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Please check email and password',
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