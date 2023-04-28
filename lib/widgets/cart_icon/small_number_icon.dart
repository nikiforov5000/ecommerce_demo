import 'package:flutter/material.dart';

class SmallNumberIcon extends StatelessWidget {
  final int _amount;
  final _style = const TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  const SmallNumberIcon({super.key, required amount}) : _amount = amount;

  @override
  Widget build(BuildContext context) {
    return Text(
      _amount.toString(),
      style: _style,
    );
  }
}
