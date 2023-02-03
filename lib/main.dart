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

  Widget screen = WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: navbarItems,
          unselectedItemColor: kUnselectedNavItem,
          selectedItemColor: kDarkTextColor,
          currentIndex: _selectedScreenIndex,
          onTap: (index) {
            setState(() {
              switch (index) {
                case 0:
                  _selectedScreenIndex = index;
                  screen = ProductsListScreen();
                  print(screen);
                  break;
                case 1:
                  _selectedScreenIndex = index;
                  screen = ShoppingCartScreen();
                  print(screen);
                  break;
                case 2:
                  _selectedScreenIndex = index;
                  screen = WelcomeScreen();
                  print(screen);
                  ;
              }
            });
          }),
      body: Navigator(
        onGenerateRoute: (settings) {
          if (settings.name == ProductsListScreen.id) {
            screen = ProductsListScreen();
          }
          if (settings.name == ShoppingCartScreen.id) {
            screen = ShoppingCartScreen();
          }
          if (settings.name == WelcomeScreen.id) {
            screen = WelcomeScreen();
          }
          if (settings.name == ProductScreen.id) {
            final Product product = settings.arguments as Product;
            screen = ProductScreen(product: product);
          }
          if (settings.name == CheckoutScreen.id) {
            screen = CheckoutScreen();
          }
          if (settings.name == RegistrationScreen.id) {
            screen = RegistrationScreen();
          }
          if (settings.name == LoginScreen.id) {
            screen = LoginScreen();
          }
          return MaterialPageRoute(builder: (_) => screen);
        },
      ),
    );
  }
}
