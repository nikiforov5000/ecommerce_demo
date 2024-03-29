import 'package:ecommerce_demo/screens/categories_screen/categories_screen.dart';
import 'package:ecommerce_demo/screens/login_screen/login_screen.dart';
import 'package:ecommerce_demo/screens/order_success/order_success_screen.dart';
import 'package:ecommerce_demo/screens/order_summary/order_summary.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/screens/user_account_screen/user_account_screen.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/services/user_account_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_demo/screens/checkout_screen_unused.dart';
import 'package:ecommerce_demo/screens/product_screen/product_screen.dart';
import 'package:ecommerce_demo/screens/registration_screen/registration_screen.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/constants/colors.dart';
import 'package:ecommerce_demo/constants/text_styles.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/wrapper.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserAccountProvider()),
        ChangeNotifierProvider(create: (_) => LocalUserProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Wrapper.id,
        routes: {
          CategoriesScreen.id: (context) => CategoriesScreen(),
          Wrapper.id: (context) => Wrapper(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ShoppingCartScreen.id: (context) => ShoppingCartScreen(),
          CheckoutScreen.id: (context) => CheckoutScreen(),
          UserAccountScreen.id: (context) => UserAccountScreen(),
          ProductsListScreen.id: (context) => ProductsListScreen(),
          OrderSummary.id: (context) => OrderSummary(),
          OrderSuccessScreen.id: (context) => OrderSuccessScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductScreen.id) {
            final product = settings.arguments as Product;
            return MaterialPageRoute(
                builder: (context) => ProductScreen(product: product),
            );
          }
        },
        theme: ThemeData().copyWith(
          appBarTheme: AppBarTheme().copyWith(

            color: kAppBarBackgrooundColor,
            titleTextStyle: kAppbarTextStyle,
            elevation: 0.5,
            iconTheme: IconThemeData(color: kBackgroundColor),
          ),
        ),
      ),
    );
  }
}

