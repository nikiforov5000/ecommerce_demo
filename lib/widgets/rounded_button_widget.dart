import 'package:flutter/material.dart';

import 'package:ecommerce_demo/constants/decorations.dart';

class RoundedButton extends StatelessWidget {
  final Widget labelWidget;
  final VoidCallback onTapCallback;

  const RoundedButton({
    Key? key,
    required this.labelWidget,
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
            child: labelWidget,
          ),
        ),
      ),
    );
  }
}
