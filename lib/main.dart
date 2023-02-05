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
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await productData.fetchData();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        EcommerceDemoApp.id: (context) => EcommerceDemoApp(),
      },
      home: WelcomeScreen(),
=======
      debugShowCheckedModeBanner: false,
      home: EcommerceDemoApp(),
>>>>>>> 2ff649a (removed debug label)
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
  static String id = 'ecommerce_demo_app';

  @override
  State<EcommerceDemoApp> createState() => _EcommerceDemoAppState();
}

class _EcommerceDemoAppState extends State<EcommerceDemoApp> {
  final _auth = FirebaseAuth.instance;
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
          if (_auth.currentUser != null) {
            _auth.signOut();
          }
          Navigator.popUntil(context, (route) => route == WelcomeScreen.id);
          Navigator.pushNamed(context, WelcomeScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: getNavbarItems(_auth.currentUser != null),
        unselectedItemColor: kUnselectedNavItem,
        selectedItemColor: kDarkTextColor,
        currentIndex: _selectedScreenIndex,
        onTap: _updateScreen,
      ),
      body: buildNavigator(),
    );
  }

  Navigator buildNavigator() {
    print('buildNavigator');
    return Navigator(
      onGenerateRoute: (settings) {
        Map<String, Widget> _screens = {
          WelcomeScreen.id: WelcomeScreen(),
          ProductsListScreen.id: ProductsListScreen(),
          ShoppingCartScreen.id: ShoppingCartScreen(),
          CheckoutScreen.id: CheckoutScreen(),
          RegistrationScreen.id: RegistrationScreen(),
          LoginScreen.id: LoginScreen(),
          EcommerceDemoApp.id: EcommerceDemoApp(),
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
