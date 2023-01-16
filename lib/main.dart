import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
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
        ProductsListScreen.id: (context) => ProductsListScreen(),
        ProductScreen.id: (context) => const ProductScreen(),
      },
    );
  }
}




// initialRoute: WelcomeScreen.id,
// routes: {
// WelcomeScreen.id:       (context) => WelcomeScreen(),
// LoginScreen.id:         (context) => LoginScreen(),
// RegistrationScreen.id:  (context) => RegistrationScreen(),
// ChatScreen.id:          (context) => ChatScreen(),
// },
