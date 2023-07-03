import 'package:flutter/material.dart';

class LineText extends StatelessWidget {
  final String _text;
  const LineText(text, {Key? key})
      : _text = text ?? '--',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(fontSize: 16),
    );
  }
}
