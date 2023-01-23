import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/login_screen.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:ecommerce_demo/screens/registration_screen.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'screens/product_screen.dart';

void main() async {

  await productData.fetchData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: ProductsListScreen.id,
      routes: {
        ShoppingCartPage.id: (context) => ShoppingCartPage(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ProductsListScreen.id: (context) => ProductsListScreen(),
        ProductScreen.id: (context) => const ProductScreen(),
      },
    );
  }
}

