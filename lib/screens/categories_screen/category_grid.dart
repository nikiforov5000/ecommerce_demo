import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key, required this.categories}) : super(key: key);

  final List<ProductCategory> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: categories.map((category) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: CategoryTile(
            category: category,
            onTapCallback: () async {
              await ProductData.getProductsOfCategory(category.name);
              Navigator.pushNamed(context, ProductsListScreen.id);
            },
          ),
        );
      }).toList(),
    );
  }
}