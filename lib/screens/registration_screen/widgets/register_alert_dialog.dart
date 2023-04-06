import 'package:flutter/material.dart';

Widget showAlertDialogWithMessage(BuildContext context, String message) {
  print(context);
  return AlertDialog(
    title: Center(
      child: Text(
        message,
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