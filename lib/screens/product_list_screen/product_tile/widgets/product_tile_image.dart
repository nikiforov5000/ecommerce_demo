import 'package:flutter/material.dart';

class ProductTileImage extends StatelessWidget {
  const ProductTileImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
