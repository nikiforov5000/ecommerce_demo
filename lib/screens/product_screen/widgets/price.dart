import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final Product _product;
  const Price(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${_product.price.toStringAsFixed(2)}',
      style: kButtonTextStyle,
    );
  }
}

