import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Flexible(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('Or'),
          ),
          Flexible(child: Divider()),
        ],
      ),
    );
  }
}
