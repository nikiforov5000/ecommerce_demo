import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  Circle({required this.size, required this.color, Widget? widget});

  final double size;
  final Color color;
  Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: widget,
      ),
    ) as Widget;
  }
}