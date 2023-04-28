import 'package:ecommerce_demo/widgets/cart_icon/circle_cart_icon.dart';
import 'package:ecommerce_demo/widgets/cart_icon/small_number_icon.dart';
import 'package:flutter/material.dart';

class CreateIcon extends StatelessWidget {
  final int _amount;
  final TextStyle style = const TextStyle(color: Colors.black);

  const CreateIcon({super.key, required amount}) : _amount = amount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        const CircleCartIcon(),
        SmallNumberIcon(amount: _amount),
      ],
    );
  }
}
