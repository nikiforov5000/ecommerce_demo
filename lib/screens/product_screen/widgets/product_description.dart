import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final Product _product;
  const ProductDescription(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _product.description,
          style: kProductDescriptionTextStyle,
        ),
      ],
    );
  }
}
