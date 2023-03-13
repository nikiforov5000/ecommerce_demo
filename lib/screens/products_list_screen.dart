import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:ecommerce_demo/services/user_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../widgets/category_button.dart';
import '../widgets/product_tile.dart';
import '../widgets/user_avatar.dart';

List<Product> currentProducts = [];

class ProductsListScreen extends StatefulWidget {
  static const String id = 'productListScreen';

  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  // final _auth = FirebaseAuth.instance;
  // User? loggedInUser;


  @override
  void initState() {
    super.initState();
    ProductData.getAllProducts().then((products) {
      setState(() {
        currentProducts = products;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('eCommerce Demo'),
        actions: [
          InkWell(
            // todo this should be an avatar
            child: Center(child: Text('logout', style: TextStyle(color: Colors.black),)),
            onTap: () {
              print(user!.email);
              authService.signOut();
            },
          )
          // Text(userProvider.user == null ? 'null' : userProvider.user.email),
          // todo update UserAvatar to receive User
          // UserAvatarWidget(user: user),
        ],
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
                      ProductData.getAllProducts().then((products) {
                        setState(() {
                          currentProducts = products;
                        });
                      });
                    },
                  ),
                  for (String category in productData.getCategoriesList())
                    CategoryButton(
                      label: category,
                      onTapCallback: () {
                        ProductData.getProductsOfCategory(category)
                            .then((products) {
                          setState(() {
                            currentProducts = products;
                          });
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
  @override
  Widget build(BuildContext context) {
    print('ProductList build');
    return GridView.count(
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
                Navigator.pushNamed(context, ProductScreen.id, arguments: product);
              },
            ),
          )
      ],
    );
  }
}
