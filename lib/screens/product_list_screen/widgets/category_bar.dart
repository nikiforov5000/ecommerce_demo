import 'package:ecommerce_demo/models/product_category.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/category_button.dart';
import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  final Function onChangesCallback;
  CategoryBar({required this.onChangesCallback, super.key});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryButton(
              label: 'All products',
              onTapCallback: () async {
                await ProductData.getAllProducts();
                widget.onChangesCallback();
              },
            ),
            for (ProductCategory category in productData.getCategoriesList())
              CategoryButton(
                  label: category.name,
                  onTapCallback: () async {
                    await ProductData.getProductsOfCategory(category.name);
                    widget.onChangesCallback();
                  },
              ),
              // GestureDetector(
              //   onTap: () async {
              //   },
              //   child: Text(category.name),
              //
              // )
              // CategoryButton(
              //   label: category.name,
              //   onTapCallback: () {
              //     ProductData.getProductsOfCategory(category.name).then(
              //       (products) {
              //         setState(() {
              //           currentProducts = products;
              //         });
              //       },
              //     );
              //   },
              // ),
          ],
        ),
      ),
    );
  }
}
