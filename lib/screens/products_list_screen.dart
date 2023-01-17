import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:ecommerce_demo/widgets/sized_box_vertical_separator.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/product_tile.dart';

class ProductsListScreen extends StatefulWidget {
  static const String id = 'productListScreen';

  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    String currentCategory = 'Jewelery';

    return Scaffold(
      body: Column(
        children: [
          kProductScreenTopBottomBlancSizedBox,
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                productData.getCategoriesLength(),
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentCategory = productData.getCategoryAt(index);
                          print(currentCategory);
                        });
                      },
                      child: Center(
                        child: Text(productData.getCategoryAt(index)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: GridView.count(crossAxisCount: 3, children: [
              for (var product
                  in productData.getProductsOfCategory(currentCategory))
                ProductTile(
                  product: product,
                  onTapCallback: () {
                    Navigator.pushNamed(context, ProductScreen.id,
                        arguments: product);
                  },
                ),
            ]
                // children: List.generate(
                //   productData.getLength(),
                //   (index) => ProductTile(
                //     product: productData.getProduct(index),
                //     onTapCallback: () {
                //       Navigator.pushNamed(context, ProductScreen.id,
                //           arguments: productData.getProduct(index));
                //     },
                //   ),
                // ),
                ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
