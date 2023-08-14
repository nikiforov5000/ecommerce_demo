import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_details_section.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_image_section.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.onTapCallback,
  }) : super(key: key);

  final Product product;
  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        decoration: kButtonDecoration.copyWith(color: Colors.grey.shade200),
        child: Column(
          children: [
            ProductImageSection(product: product),
            ProductDetailsSection(product: product),
          ],
        ),
      ),
    );
  }
}
