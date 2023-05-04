import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTapCallback;

  const CategoryButton({
    Key? key,
    required this.label,
    required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
      decoration: kButtonDecoration,
      child: InkWell(
        onTap: onTapCallback,
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
