import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/decorations.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTapCallback;
  final String label;

  const RoundedButton({
    Key? key,
    required this.label,
    required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 15),
        child: Container(
          decoration: kButtonDecoration,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(label,
                textAlign: TextAlign.center,
                style: kButtonTextStyle
              ),
            ),
          ),
        ),
      ),
    );
  }
}
