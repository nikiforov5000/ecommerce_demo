import 'package:flutter/material.dart';

import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTapCallback;

  CategoryButton({required this.label, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: kButtonDecoration,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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