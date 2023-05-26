import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_demo/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final ShoppingCartItem cartItem;

  const InfoSection({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Product product = ProductData.getProduct(cartItem.productId!);
        Navigator.pushNamed(context, ProductScreen.id, arguments: product);
      },
      child: Text(cartItem.title!),
    );
  }
}
