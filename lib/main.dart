import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/checkout_screen.dart';
import 'package:ecommerce_demo/screens/login_screen.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:ecommerce_demo/screens/registration_screen.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen.dart';
import 'package:ecommerce_demo/screens/welcome_screen.dart';
import 'package:ecommerce_demo/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'constants/text_styles.dart';
import 'screens/product_screen.dart';

void main() async {
  await productData.fetchData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EcommerceDemoApp();
  }
}

class EcommerceDemoApp extends StatefulWidget {
  EcommerceDemoApp({Key? key}) : super(key: key);

  @override
  State<EcommerceDemoApp> createState() => _EcommerceDemoAppState();
}

class _EcommerceDemoAppState extends State<EcommerceDemoApp> {
  int _selectedScreenIndex = 0;

  List<Widget> _screens = [
    ProductsListScreen(),
    ShoppingCartScreen(),
    WelcomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        appBarTheme: AppBarTheme().copyWith(
          color: kTileColor,
          titleTextStyle: kAppbarTextStyle,
          elevation: 0.5,
          iconTheme: IconThemeData(color: kDarkTextColor),
        ),
      ),
      home: Scaffold(
        body: _screens.elementAt(_selectedScreenIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: navbarItems,
          currentIndex: _selectedScreenIndex,
          unselectedItemColor: kUnselectedNavItem,
          selectedItemColor: kDarkTextColor,
          onTap: _onItemTapped,
        ),
      ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        CheckoutScreen.id: (context) => CheckoutScreen(),
        ShoppingCartScreen.id: (context) => ShoppingCartScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ProductsListScreen.id: (context) => ProductsListScreen(),
        ProductScreen.id: (context) => ProductScreen(),
      },
    );
  }
}
