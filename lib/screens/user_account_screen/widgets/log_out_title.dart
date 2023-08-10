import 'package:flutter/material.dart';

class LogoutTitle extends StatelessWidget {
  const LogoutTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Log Out',
          style: TextStyle(fontSize: 12),
        ),
      ),
      onTap: () {},
    );
  }
}

