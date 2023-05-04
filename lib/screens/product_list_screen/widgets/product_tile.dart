import 'package:flutter/material.dart';

import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/product_tile_image.dart';

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
