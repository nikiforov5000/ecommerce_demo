import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:ecommerce_demo/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  List<Product> currentProducts = productData.getAllProducts();

  @override
  Widget build(BuildContext context) {
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
        color: kTileColor,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RoundedButton(
                    label: 'All products',
                    onTapCallback: () {
                      setState(() {
                        currentProducts = productData.getAllProducts();
                      });
                    },
                  ),
                  for (String category in productData.getCategoriesList())
                    RoundedButton(
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
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.count(crossAxisCount: 2, children: [
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
