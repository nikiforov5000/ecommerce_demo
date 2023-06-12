import 'package:ecommerce_demo/screens/order_success/constants.dart';
import 'package:flutter/material.dart';

import 'circle.dart';

class CircleCheckIconWidget extends StatelessWidget {
  const CircleCheckIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Circle(size: 50, color: Colors.white),
          Circle(size: 40, color: kCardBackgroundColor),
          const Icon(Icons.check_rounded, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}
