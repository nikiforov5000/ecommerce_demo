import 'package:ecommerce_demo/models/product.dart';

ShoppingCart shoppingCart = ShoppingCart();

class ShoppingCart {
  Map<Product, int> _shoppingCart = {};
  double _sum = 0;
  int _amount = 0;

  int get length => _shoppingCart.length;

  getCartMap() {
    return _shoppingCart;
  }

  getSize() {
    return _shoppingCart.length;
  }

  getSum() {
    return _sum;
  }

  addProduct(Product product, int quantity) {
    if (_shoppingCart.keys.contains(product)) {
      quantity += _shoppingCart[product]!;
    }
    _shoppingCart[product] = quantity;
    updateSum();

  }

  void updateQty({required Product product, required int qty}) {
    if (qty == 0) {
      _shoppingCart.remove(product);
    }
    else {
      _shoppingCart[product] = qty;
    }
    updateSum();
  }

  void updateSum() {
    _sum = 0;
    _shoppingCart.forEach((product, qty) {
      _sum += product.price * qty;
      _amount += qty;
    });
  }

  getAmount() {
    return _amount;
  }
}
