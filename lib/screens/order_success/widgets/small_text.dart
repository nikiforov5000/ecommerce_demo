import 'package:ecommerce_demo/screens/order_success/constants.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  SmallText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: kSmallFontTextStyle,
    );
  }
}
