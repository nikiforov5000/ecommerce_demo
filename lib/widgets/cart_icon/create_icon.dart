import 'package:ecommerce_demo/constants/colors.dart';
import 'package:flutter/material.dart';

class CreateIcon extends StatelessWidget {
  final bool isFull;
  final TextStyle style = const TextStyle(color: Colors.black);

  const CreateIcon(this.isFull, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Icon(
          isFull
          ? Icons.shopping_cart
          : Icons.shopping_cart_outlined,
          color: kAppBarIconColor,
          size: 23,
        ),
      ],
    );
  }
}
