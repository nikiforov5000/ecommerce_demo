import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  final Product _product;
  const ProductRating(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Rating: ',
          style: kProductScreenRatingTextStyle,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: getRatingColor(_product.rate),
          ),
          child: Text(
            _product.rate.toString(),
            style: kProductScreenRatingTextStyle,
          ),
        ),
      ],
    );
  }
}
