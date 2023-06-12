import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/product_tile.dart';
import 'package:ecommerce_demo/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      const SliverGridDelegate sliverGridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);
    return Flexible(
      child: GridView.builder(
        itemCount: displayedProducts.length,
        gridDelegate: sliverGridDelegate,
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
}