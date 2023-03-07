import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/product.dart';
import '../widgets/category_button.dart';
import '../widgets/product_tile.dart';

List<Product> currentProducts = [];

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
    ProductData.getAllProducts().then((products) {
      setState(() {
        currentProducts = products;
      });
    });
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    } catch (e) {
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
        actions: [
          UserAvatar(user: loggedInUser),
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

class UserAvatar extends StatelessWidget {
  UserAvatar({required this.user});

  User? user;
  Widget? avatar;

  @override
  Widget build(BuildContext context) {
    BuildUserAvatar();
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.greenAccent,
          radius: 21,
          child: avatar!,
        )
      ),
    );
  }

  void BuildUserAvatar() {
      // buildEmptyAvatar();
      // buildFromPhoto();
      // buildFromName();
      // buildFromEmail();
      // return;
    buildEmptyAvatar();
    if (user != null) {
      if (user!.photoURL != null) {
        buildFromPhoto();
      }
      else if (user!.displayName != null) {
        buildFromName();
      }
      else if (user!.email != null) {
        buildFromEmail();
      }
    }
  }

  void buildFromPhoto() {
    avatar =  CircleAvatar(
      backgroundImage: NetworkImage(user!.photoURL!),
      radius: 18,
    );
  }

  void buildFromName() {
    String? initials = user!.displayName
        ?.split(' ')
        .getRange(0, 2)
        .map((e) => e = e[0])
        .join('');
    avatar = CircleAvatar(
      radius: 18,
      child: Text(initials!),
    );
  }

  void buildEmptyAvatar() {
    avatar = Icon(
      Icons.account_circle,
      size: 40,
    );
  }

  void buildFromEmail() {
    String emailInitials = user!.email.toString().substring(0, 2).toUpperCase();
    avatar = Text(emailInitials);
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
                Navigator.pushNamed(context, ProductScreen.id,
                    arguments: product);
              },
            ),
          )
      ],
    );
  }
}
