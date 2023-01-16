import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  ProductTile({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
