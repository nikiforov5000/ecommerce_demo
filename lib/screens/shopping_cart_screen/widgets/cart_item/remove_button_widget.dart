import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoveButtonWidget extends StatelessWidget {
  const RemoveButtonWidget({super.key, required this.cartItem});

  final ShoppingCartItem cartItem;
  @override
  Widget build(BuildContext context) {
    var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    var shoppingCart = shoppingCartProvider.shoppingCart;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          shoppingCart!.removeCartItem(cartItem);
        },
        child: const Text(
          'Remove',
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

