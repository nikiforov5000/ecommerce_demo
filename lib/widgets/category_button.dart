import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTapCallback;

  CategoryButton({required this.label, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        height: 50,
        width: 100,
        child: InkWell(
          onTap: onTapCallback,
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    );
  }
}