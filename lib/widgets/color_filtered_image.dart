import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/product.dart';

class ColorFilteredImage extends StatelessWidget {
  const ColorFilteredImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(kTileColor, BlendMode.darken),
      child: Image(
        image: NetworkImage(
          product.imgUrl,
        ),
      ),
    );
  }
}
