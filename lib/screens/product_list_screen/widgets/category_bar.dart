import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/category_button.dart';
import 'package:flutter/material.dart';

class CategoryBar extends StatelessWidget {
  final VoidCallback onCategoryChanged;

  const CategoryBar({
    Key? key,
    required this.onCategoryChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          itemCount: productData.getCategoriesLength() + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return CategoryButton(
                label: 'All products',
                onTapCallback: () async {
                  await ProductData.getAllProducts();
                  onCategoryChanged();
                },
              );
            }
            ProductCategory category =
                productData.getCategoriesList()[index - 1];
            return CategoryButton(
              label: category.name,
              onTapCallback: () async {
                await ProductData.getProductsOfCategory(category.name);
                onCategoryChanged();
              },
            );
          },
        ),
      ),
    );
  }
}
