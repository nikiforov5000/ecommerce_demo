import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTapCallback;
  final String label;
  final Color color;

  const RoundedButton({
    Key? key,
    required this.label,
    required this.color,
    required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onTapCallback,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
