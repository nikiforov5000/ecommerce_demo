import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/product.dart';
import '../widgets/category_button.dart';
import '../widgets/product_tile.dart';

List<Product> currentProducts = productData.getAllProducts();

class ProductsListScreen extends StatefulWidget {
  static const String id = 'productListScreen';

  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    }
    catch (e) {
      print(e);
    }

  }

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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: kBackgroundColor,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
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
              child: ProductsList(),
            ),
          ],
        ),
      ),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: ProductTile(
            product: product,
            onTapCallback: () {
              Navigator.pushNamed(context, ProductScreen.id,
                  arguments: product);
            },
          ),
        ),
    ]);
  }
}
