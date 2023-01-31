import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/product.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/category_button.dart';
import '../widgets/product_tile.dart';

List<Product> currentProducts = productData.getAllProducts();

class ProductsListScreen extends StatelessWidget {
  static const String id = 'productListScreen';

  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('eCommerce Demo'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: kBackgroundColor,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: CategoryListview(),
            ),
            Expanded(
              flex: 10,
              child: ProductsList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class CategoryListview extends StatefulWidget {
  @override
  State<CategoryListview> createState() => _CategoryListviewState();
}

class _CategoryListviewState extends State<CategoryListview> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        CategoryButton(
          label: 'All products',
          onTapCallback: () {
            setState(() {
              currentProducts = productData.getAllProducts();
            });
          },
        ),
        for (String category in productData.getCategoriesList())
          CategoryButton(
            label: category,
            onTapCallback: () {
              setState(() {
                currentProducts = productData.getProductsOfCategory(category);
              });
            },
          ),
      ],
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ProductList build');
    return GridView.count(crossAxisCount: 2, children: [
      for (var product in currentProducts)
        ProductTile(
          product: product,
          onTapCallback: () {
            Navigator.pushNamed(context, ProductScreen.id, arguments: product);
          },
        ),
    ]);
  }
}
