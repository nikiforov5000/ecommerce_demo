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
    print(product.title);
    print(quantity);
    _shoppingCart[product] = quantity;
    sum += product.price * quantity;
  }

}
