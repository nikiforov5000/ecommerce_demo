import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/product_data.dart';


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
    _shoppingCart[product] = quantity;
    sum += product.price * quantity;
  }
}