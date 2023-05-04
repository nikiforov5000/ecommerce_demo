import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/product_tile_image.dart';
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
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
