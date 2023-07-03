import 'package:flutter/material.dart';

class LineTitle extends StatelessWidget {
  final String _title;
  const LineTitle(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black54,
      ),
    );
  }
}
