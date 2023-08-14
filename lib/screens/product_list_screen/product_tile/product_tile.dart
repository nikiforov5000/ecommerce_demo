import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_price.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_rating.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_tile_image.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_title.dart';
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
        decoration: kButtonDecoration,
        child: Column(
          children: [
            Flexible(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTileImage(imageUrl: product.imgUrl),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: FittedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ProductTitle(title: product.title),
                      ProductRating(rating: product.rate),
                      const SizedBox(height: 3),
                      ProductPrice(price: product.price),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
