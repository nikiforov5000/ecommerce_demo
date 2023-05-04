import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/product_tile.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  final List<Product> currentProducts;
  ProductsList({required this.currentProducts});

  @override
  Widget build(BuildContext context) {
    print('ProductList build');
    return Expanded(
      flex: 10,
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          for (var product in currentProducts)
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: ProductTile(
                product: product,
                onTapCallback: () {
                  print('ProductList.buld ' + product.title + ' was tapped');
                  Navigator.pushNamed(context, ProductScreen.id,
                      arguments: product);
                },
              ),
            )
        ],
      ),
    );
  }
}