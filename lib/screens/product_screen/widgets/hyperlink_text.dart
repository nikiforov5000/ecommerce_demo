import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:flutter/material.dart';

class HyperlinkText extends StatelessWidget {
  final String category;
  const HyperlinkText(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await ProductData.getProductsOfCategory(category);
        Navigator.pushNamed(context, ProductsListScreen.id);
      },
      child: Text(
        category,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: kBreadcrumbsTextStyle,
      ),
    );
  }
}
