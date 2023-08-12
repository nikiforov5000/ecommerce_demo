import 'package:ecommerce_demo/constants/decorations.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/widgets/color_filtered_image.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/widgets/product_tile_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    required this.category,
    required this.onTapCallback,
  });
  final ProductCategory category;
  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: kButtonDecoration,
        child: Stack(
          children: [
            Center(child: Opacity(opacity: .2, child: Image.network(category.imgUrl),)),
            Center(child: Text(category.name.toUpperCase(), textAlign: TextAlign.center,),),
          ],
        ),
      ),
    );
  }
}
