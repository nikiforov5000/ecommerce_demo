import 'package:ecommerce_demo/constants/colors.dart';
import 'package:flutter/material.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome',
        style: TextStyle(
          color: kDarkTextColor,
          fontWeight: FontWeight.w600,
          fontSize: 50,
        ),
      ),
    );
  }
}
