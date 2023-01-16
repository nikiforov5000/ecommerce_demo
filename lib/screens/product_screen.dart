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
        children: List.generate(20,
            (index) => ProductTile(text: 'Hello, this is ${index}th product')),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
