import 'package:ecommerce_demo/constants/colors.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: InkWell(
        onTap: onTapCallback,
        child: Container(
          decoration: kButtonDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 3,
                child: ProductTileImage(product: product),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Text(
                      product.getShortTitle(),
                      textAlign: TextAlign.center,
                      style: kProductTileTitleTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  '\$${product.price}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


