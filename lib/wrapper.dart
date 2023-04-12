import 'package:ecommerce_demo/models/shoppint_cart/shopping_cart.dart';
import 'package:ecommerce_demo/models/user/local_user.dart';
import 'package:ecommerce_demo/models/user_account/user_account.dart';
import 'package:ecommerce_demo/screens/categories_screen/categories_screen.dart';
import 'package:ecommerce_demo/screens/login/login_screen.dart';
import 'package:ecommerce_demo/services/auth_service.dart';
import 'package:ecommerce_demo/services/local_user_provider.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> _setCurrentShoppingCart(ShoppingCartProvider shoppingCartProvider, LocalUser user) async {
  final userAccount = await UserAccount.fetchAccount(uid: user.uid);
  shoppingCartProvider.shoppingCart = ShoppingCart(id: userAccount.shoppingCartRef.id);
}

class Wrapper extends StatelessWidget {
  static String id = '/wrapper';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final _shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return StreamBuilder<LocalUser?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<LocalUser?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final LocalUser? user = snapshot.data;
          if (user == null) {
            print('wrapper.dart -> user is NULL');
            return LoginScreen();
          }
          else {
            print('wrapper.dart -> user is ${user.email}');
            _setCurrentShoppingCart(_shoppingCartProvider, user);
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
