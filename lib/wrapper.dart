// import 'dart:html';

import 'package:ecommerce_demo/models/product_data.dart';
import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/categories_screen/categories_screen.dart';
import 'package:ecommerce_demo/screens/product_list_screen/products_list_screen.dart';
import 'package:ecommerce_demo/screens/product_screen/product_screen.dart';
import 'package:ecommerce_demo/screens/user_account_screen/user_account_screen.dart';
import 'package:ecommerce_demo/screens/welcome_screen/welcome_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:ecommerce_demo/services/user_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> _setCurrentShoppingCart(
    ShoppingCartProvider shoppingCartProvider, LocalUser user) async {
  final UserAccount userAccount = await UserAccount.fetchAccount(uid: user.uid);
  // print('wrapper.dart -> _setCurrentShoppingCart() -> userAccount: $userAccount');
  ShoppingCart shoppingCart = ShoppingCart(id: userAccount.cartId);
  shoppingCart.setItemsAmount();
  shoppingCartProvider.shoppingCart = shoppingCart;
}

class Wrapper extends StatelessWidget {
  static String id = '/wrapper';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final userProvider = Provider.of<LocalUserProvider>(context);

    final userAccountProvider = Provider.of<UserAccountProvider>(context);

    return StreamBuilder<LocalUser?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<LocalUser?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final LocalUser? user = snapshot.data;
          if (user == null) {
            print('wrapper.dart -> user is NULL');
            return WelcomeScreen();
          } else {
            userProvider.localUser = user;
            _setCurrentShoppingCart(shoppingCartProvider, user);
            Future.microtask((){
              Navigator.popUntil(context, (route) => route.isFirst);
            });
            if (userAccountProvider.userAccount == null || isChecking()) {
              UserAccount.fetchAccount(uid: user.uid).then((value) {userAccountProvider.userAccount = value; });
            }
            return CategoriesScreen();
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}


bool isChecking() {
  print('isChecking');
  return false;
}