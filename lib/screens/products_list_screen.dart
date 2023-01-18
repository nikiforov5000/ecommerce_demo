import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:ecommerce_demo/widgets/sized_box_vertical_separator.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/product_tile.dart';

class ProductsListScreen extends StatefulWidget {
  static const String id = 'productListScreen';

  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  List<Product> currentProducts = productData.getProductsOfCategory('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kProductScreenTopBottomBlancSizedBox,
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryButton(
                  label: 'All products',
                  onTapCallback: () {
                    setState(() {
                      currentProducts = productData
                          .getProductsOfCategory('non existing category');
                    });
                  },
                ),
                for (String category in productData.getCategoriesList())
                  CategoryButton(
                    label: category,
                    onTapCallback: () {
                      setState(() {
                        currentProducts =
                            productData.getProductsOfCategory(category);
                      });
                    },
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: GridView.count(crossAxisCount: 3, children: [
              for (var product in currentProducts)
                ProductTile(
                  product: product,
                  onTapCallback: () {
                    Navigator.pushNamed(context, ProductScreen.id,
                        arguments: product);
                  },
                ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTapCallback;

  CategoryButton({required this.label, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        height: 50,
        width: 100,
        child: InkWell(
          onTap: onTapCallback,
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
