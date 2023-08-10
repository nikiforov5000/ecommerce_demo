import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:flutter/material.dart';
class ProfileDetailsItem extends StatelessWidget {
  const ProfileDetailsItem({required this.label, required this.text, Key? key,})
      : super(key: key);

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            '$label:  ',
            style: kProfileDetailsItemLabelTextStyle,
          ),
          Text(
            text,
            style: kProfileDetailsItemTextTextStyle,
          ),
        ],
      ),
    );
  }
}


