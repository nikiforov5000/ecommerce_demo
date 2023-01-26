import 'package:ecommerce_demo/models/product.dart';

ShoppingCart shoppingCart = ShoppingCart();


class ShoppingCart {
  Map<Product, int> _shoppingCart = {};
  double sum = 0;

  getCartMap() {
    return _shoppingCart;
  }

  getSize() {
    return _shoppingCart.length;
  }

  getSum() {
    return sum;
  }

  addProduct(Product product, int quantity) {
    if (_shoppingCart.keys.contains(product)) {
      print('contains');
      int? currentQuantity = _shoppingCart[product];
      _shoppingCart[product] = quantity + currentQuantity!;
    }
    else {
      print('doesnt contains');
      _shoppingCart[product] = quantity;
      sum += product.price * quantity;
    }
  }

}
