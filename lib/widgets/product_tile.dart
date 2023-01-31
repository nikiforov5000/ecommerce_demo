import 'package:ecommerce_demo/widgets/product_tile_image.dart';
import 'package:flutter/material.dart';

import '../constants/decorations.dart';
import '../constants/text_styles.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  ProductTile({required this.product, required this.onTapCallback});

  final Product product;
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
            Flexible(
              flex: 4,
              child: ProductTileImage(product: product),
            ),
            Flexible(
              child: Text(
                product.getShortTitle(),
                textAlign: TextAlign.center,
                style: kProductTileTitleTextStyle,
              ),
            ),
            Flexible(
              child: Text(
                '\$${product.price}',
                textAlign: TextAlign.center,
                style: kProductTilePriceTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
