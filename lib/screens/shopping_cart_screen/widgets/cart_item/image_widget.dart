import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:ecommerce_demo/widgets/color_filtered_image.dart';
import 'package:flutter/material.dart';

class CartItemImageWidget extends StatelessWidget {
  const CartItemImageWidget({super.key, required this.cartItem});

  final ShoppingCartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          Product product = ProductData.getProduct(cartItem.productId!);
          Navigator.pushNamed(context, ProductScreen.id,
              arguments: product);
        },
        child: ColorFilteredImage(imgUrl: cartItem.imgUrl!),
      ),
    );
  }
}