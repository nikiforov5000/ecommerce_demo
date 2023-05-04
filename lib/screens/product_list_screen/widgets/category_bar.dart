import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/category_button.dart';
import 'package:flutter/material.dart';

class CategoryBar extends StatelessWidget {
  List<Product> currentProducts;
  CategoryBar({required this.currentProducts, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryButton(
            label: 'All products',
            onTapCallback: () {
              ProductData.getAllProducts().then((products) {
                // setState(() {
                  currentProducts = products;
                // });
              });
            },
          ),
          for (ProductCategory category in productData.getCategoriesList())
            CategoryButton(
              label: category.name,
              onTapCallback: () {
                ProductData.getProductsOfCategory(category.name)
                    .then((products) {
                  // setState(() {
                    currentProducts = products;
                  // });
                });
              },
            ),
        ],
      ),
    );
  }
}
