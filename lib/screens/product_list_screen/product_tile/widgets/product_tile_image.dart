import 'package:ecommerce_demo/widgets/color_filtered_image.dart';
import 'package:flutter/material.dart';

class ProductTileImage extends StatelessWidget {
  const ProductTileImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ColorFilteredImage(imgUrl: imageUrl);
  }
}
