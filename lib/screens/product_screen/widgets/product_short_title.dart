import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductShortTitle extends StatelessWidget {
  Product _product;
  ProductShortTitle(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         Text(
      _product.title,
      style: kProductScreenTitleTextStyle,
      textAlign: TextAlign.center,
    );
  }
}