import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Profile',
          style: kHeaderTextStyle,
        ),
      ],
    );
  }
}
