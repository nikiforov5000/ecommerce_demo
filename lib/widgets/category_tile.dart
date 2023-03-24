import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/widgets/product_tile_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    required this.category,
    required this.onTapCallback,
  });

  final String category;
  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: kButtonDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Flexible(
            //   flex: 4,
            //   child: ProductTileImage(product: product),
            // ),
            // Flexible(
            //   child: Text(
            //     product.getShortTitle(),
            //     textAlign: TextAlign.center,
            //     style: kProductTileTitleTextStyle,
            //   ),
            // ),
            // Flexible(
            //   child: Text(
            //     '\$${product.price}',
            //     textAlign: TextAlign.center,
            //     style: kProductTilePriceTextStyle,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
