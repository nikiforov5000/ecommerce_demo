import 'package:ecommerce_demo/constants/colors.dart';
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
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          IgnorePointer(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.lighten,
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                    colors: [
                      kBackgroundColor,
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.1),
                      kBackgroundColor,
                    ],
                    stops: [
                      0.0,
                      0.15,
                      0.85,
                      1.0,
                    ],
                  ),
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryBarArrowWidget(Icons.arrow_back_ios),
                  CategoryBarArrowWidget(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryBarArrowWidget extends StatelessWidget {
  final IconData _icon;
  CategoryBarArrowWidget(this._icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      _icon,
      color: Colors.white,
      shadows: const [
        Shadow(
          color: Colors.black38,
          offset: Offset(1, 1),
          blurRadius: 10,
        ),
      ],
    );
  }
}
