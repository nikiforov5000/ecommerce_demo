import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    final cart = cartProvider.shoppingCart;

    bool isNotEmpty = cart!.isNotEmpty();
    String text = isNotEmpty ? 'isNotEmpty' : 'isNotEmpty';

    return Text('isNotEmpty', style: TextStyle(color: Colors.black),);
  }
}
