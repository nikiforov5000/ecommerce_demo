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
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: displayedProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          crossAxisCount: _getAxisCount(context),
          childAspectRatio: 4 / 5,
        ),
        itemBuilder: (BuildContext context, int index) {

          Product product = displayedProducts[index];
          return ProductTile(
            product: product,
            onTapCallback: () {
              Navigator.pushNamed(
                context,
                ProductScreen.id,
                arguments: product,
              );
            },
          );
        },
      ),
    );
  }

  int _getAxisCount(BuildContext context) {
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
