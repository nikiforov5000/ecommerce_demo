import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/screens/product_list_screen/widgets/product_tile.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    print('product_list.dart -> build()');
    return Flexible(
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
