import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/widgets/cart_icon/small_number_icon.dart';
import 'package:flutter/material.dart';

class CreateIcon extends StatelessWidget {
  final int _amount;
  final TextStyle style = const TextStyle(color: Colors.black);

  const CreateIcon({super.key, required amount}) : _amount = amount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Icon(Icons.shopping_cart, color: kAppBarIconColor, size: 23,),
      ],
    );
  }
}
