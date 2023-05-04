import 'package:ecommerce_demo/constants/colors.dart';
import 'package:flutter/material.dart';

class CreateIcon extends StatelessWidget {
  final TextStyle style = const TextStyle(color: Colors.black);

  const CreateIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: const [
        Icon(
          Icons.shopping_cart,
          color: kAppBarIconColor,
          size: 23,
        ),
      ],
    );
  }
}
