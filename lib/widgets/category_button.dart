import 'package:flutter/material.dart';

import '../constants/decorations.dart';
import '../constants/text_styles.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTapCallback;

  CategoryButton({required this.label, required this.onTapCallback});

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