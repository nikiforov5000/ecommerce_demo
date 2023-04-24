import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:flutter/material.dart';

class CartItemPriceWidget extends StatelessWidget {
  const CartItemPriceWidget({Key? key, required this.cartItem})
      : super(key: key);
  final ShoppingCartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        '\$${cartItem.price}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}