import 'package:flutter/material.dart';

class CircleCartIcon extends StatelessWidget {
  const CircleCartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundColor: Colors.greenAccent,
        radius: 21,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
