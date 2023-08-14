import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/product_tile/product_tile.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        itemCount: displayedProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getAxisCount(context),
          childAspectRatio: 4 / 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          Product product = displayedProducts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            child: ProductTile(
              product: product,
              onTapCallback: () {
                Navigator.pushNamed(
                  context,
                  ProductScreen.id,
                  arguments: product,
                );
              },
            ),
          );
        },
      ),
    );
  }

  int getAxisCount(BuildContext context) {
    double aspect = View.of(context).physicalSize.aspectRatio;
    if (aspect > 0.7) {
      return 3;
    }
    if (aspect < 0.4) {
      return 1;
    }
    return 2;
  }
}
