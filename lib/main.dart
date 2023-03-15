import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/checkout_screen.dart';
import '../screens/login_screen.dart';
import '../screens/product_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/shopping_cart_screen.dart';
import '../services/auth_service.dart';
import '../services/user_provider.dart';
import 'constants/colors.dart';
import 'constants/text_styles.dart';
import 'models/product.dart';
import 'wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Wrapper.id,
        routes: {
          Wrapper.id: (context) => Wrapper(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ShoppingCartScreen.id: (context) => ShoppingCartScreen(),
          CheckoutScreen.id: (context) => CheckoutScreen(),
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
            color: kTileColor,
            titleTextStyle: kAppbarTextStyle,
            elevation: 0.5,
            iconTheme: IconThemeData(color: kDarkTextColor),
          ),
        ),
      ),
    );
  }
}

