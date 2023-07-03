import 'package:flutter/material.dart';

class CartTitle extends StatelessWidget {
  final String _title;
  const CartTitle(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
