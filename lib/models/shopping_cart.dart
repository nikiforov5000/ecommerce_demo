import 'package:ecommerce_demo/models/product.dart';

ShoppingCart shoppingCart = ShoppingCart();

class ShoppingCart {
  Map<Product, int> _shoppingCart = {};
  double _sum = 0;

  getCartMap() {
    return _shoppingCart;
  }

  removeFromCart(Product product) {
    _shoppingCart.remove(product);
  }

  getSize() {
    return _shoppingCart.length;
  }

  getSum() {
    return _sum;
  }

  addProduct(Product product, int quantity) {
    _sum += product.price * quantity;
    if (_shoppingCart.keys.contains(product)) {
      quantity += _shoppingCart[product]!;
    }
    _shoppingCart[product] = quantity;
  }
}
