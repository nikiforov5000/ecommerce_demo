import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:flutter/cupertino.dart';

class ShoppingCartProvider extends ChangeNotifier {
  ShoppingCart? _shoppingCart;

  ShoppingCart? get shoppingCart => _shoppingCart;
  set shoppingCart(ShoppingCart? shoppingCart) => _shoppingCart = shoppingCart;
}