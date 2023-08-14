import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_tile_image.dart';
import 'package:flutter/material.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          color: kWhiteColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        alignment: AlignmentDirectional.center,
        child: ProductTileImage(imageUrl: product.imgUrl),
      ),
    );
  }
}
