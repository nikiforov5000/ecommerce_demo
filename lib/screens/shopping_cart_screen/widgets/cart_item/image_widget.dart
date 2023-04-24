import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_demo/widgets/color_filtered_image.dart';
import 'package:flutter/material.dart';

class CartItemImageWidget extends StatelessWidget {
  const CartItemImageWidget({super.key, required this.cartItem});

  final ShoppingCartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ColorFilteredImage(imgUrl: cartItem.imgUrl!),
    );
  }
}