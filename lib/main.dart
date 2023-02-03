import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/screens/checkout_screen.dart';
import 'package:ecommerce_demo/screens/login_screen.dart';
import 'package:ecommerce_demo/screens/product_screen.dart';
import 'package:ecommerce_demo/screens/products_list_screen.dart';
import 'package:ecommerce_demo/screens/registration_screen.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen.dart';
import 'package:ecommerce_demo/screens/welcome_screen.dart';
import 'package:ecommerce_demo/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'constants/text_styles.dart';
import 'models/product.dart';

void main() async {
  await productData.fetchData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EcommerceDemoApp(),
      theme: ThemeData().copyWith(
        appBarTheme: AppBarTheme().copyWith(
          color: kTileColor,
          titleTextStyle: kAppbarTextStyle,
          elevation: 0.5,
          iconTheme: IconThemeData(color: kDarkTextColor),
        ),
      ),
    );
  }
}

class EcommerceDemoApp extends StatefulWidget {
  @override
  State<EcommerceDemoApp> createState() => _EcommerceDemoAppState();
}

class _EcommerceDemoAppState extends State<EcommerceDemoApp> {
  int _selectedScreenIndex = 0;

  Widget screen = ProductsListScreen();

  void _updateScreen(index) {
    setState(() {
      switch (index) {
        case 0:
          _selectedScreenIndex = index;
          screen = ProductsListScreen();
          break;
        case 1:
          _selectedScreenIndex = index;
          screen = ShoppingCartScreen();
          break;
        case 2:
          _selectedScreenIndex = index;
          screen = WelcomeScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: navbarItems,
        unselectedItemColor: kUnselectedNavItem,
        selectedItemColor: kDarkTextColor,
        currentIndex: _selectedScreenIndex,
        onTap: _updateScreen,
      ),
      body: buildNavigator(),
    );
  }

  Navigator buildNavigator() {
    return Navigator(
      onGenerateRoute: (settings) {
        Map<String, Widget> _screens = {
          ProductsListScreen.id: ProductsListScreen(),
          ShoppingCartScreen.id: ShoppingCartScreen(),
          WelcomeScreen.id: WelcomeScreen(),
          CheckoutScreen.id: CheckoutScreen(),
          RegistrationScreen.id: RegistrationScreen(),
          LoginScreen.id: LoginScreen(),
        };
        if (_screens[settings.name] != null) {
          screen = _screens[settings.name]!;
        }
        else if (settings.name == ProductScreen.id) {
          screen = ProductScreen(product: settings.arguments as Product);
        }
        return MaterialPageRoute(builder: (_) => screen);
      },
    );
  }
}
