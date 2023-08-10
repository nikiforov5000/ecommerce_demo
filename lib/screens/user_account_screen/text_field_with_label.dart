import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const EditTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Row(
            children: [
              Text(
                label,
                style: kProfileDetailsItemLabelTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 2,
          child: TextField(
            style: kProfileDetailsItemTextTextStyle,
            decoration: InputDecoration(
              hintText: 'Enter your $label',
              border: InputBorder.none,
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
