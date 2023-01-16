import 'package:ecommerce_demo/models/product_data.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/product_tile.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          productData.getLength(),
          // (index) => Container(child: Text(index.toString()),),
          (index) => ProductTile(product: productData.getProduct(index), onTapCallback: () {},),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
