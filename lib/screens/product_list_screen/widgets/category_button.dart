import 'package:flutter/material.dart';

import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTapCallback;

  CategoryButton({required this.label, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 4),
      decoration: kButtonDecoration,
      child: InkWell(
        onTap: onTapCallback,
        child: Center(
          child: Text(label,
              textAlign: TextAlign.center,
              style: kButtonTextStyle
          ),
        ),
      ),
    );
  }
}