import 'package:flutter/material.dart';

import '../models/product.dart';
import 'color_filtered_image.dart';

class ProductTileImage extends StatelessWidget {
  const ProductTileImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ColorFilteredImage(product: product),
    );
  }
}
