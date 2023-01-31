import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/decorations.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onTapCallback;

  const RoundedButton({
    Key? key,
    required this.label,
    required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        margin: EdgeInsets.all(9),
        decoration: kButtonDecoration,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label,
              textAlign: TextAlign.center,
              style: kButtonTextStyle
            ),
          ),
        ),
      ),
    );
  }
}
