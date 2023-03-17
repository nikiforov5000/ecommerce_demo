import 'package:flutter/material.dart';
class TextOnBankCard extends StatelessWidget {
  const TextOnBankCard({ required this.text });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 17.0,
          // fontFamily: 'source-code',
          fontWeight: FontWeight.w900,
          color: Colors.white
      ),
    );
  }
}