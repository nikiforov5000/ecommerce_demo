import 'package:flutter/material.dart';

import '../constants/text_styles.dart';

class ButtonText extends StatelessWidget {
  ButtonText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.center, style: kButtonTextStyle);
  }
}
