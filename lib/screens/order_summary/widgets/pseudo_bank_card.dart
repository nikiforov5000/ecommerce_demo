import 'package:flutter/material.dart';

class PseudoBankCard extends StatelessWidget {
  const PseudoBankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.credit_card),
        SizedBox(width: 10.0),
        Text(
          '••••',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        SizedBox(width: 10.0),
        Text(
          '9643',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
