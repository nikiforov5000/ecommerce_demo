import 'package:flutter/material.dart';

import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/widgets/color_filtered_image.dart';

class ProductTileImage extends StatelessWidget {
  const ProductTileImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ColorFilteredImage(imgUrl: product.imgUrl);
  }
}
