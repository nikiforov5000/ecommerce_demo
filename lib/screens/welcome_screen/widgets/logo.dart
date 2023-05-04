import 'package:ecommerce_demo/constants/colors.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Center()),
        Expanded(
          flex: 2,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(kTileColor, BlendMode.darken),
            child: Image.asset('assets/logo/dixi-logo.png'),
          ),
        ),
        Expanded(child: Center()),
      ],
    );
  }
}