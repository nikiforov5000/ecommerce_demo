import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/product.dart';


class ShoppingCart {
  Map<Product, int> _shoppingCart = {};
  double _sum = 0;
  int _amount = 0;
  final String id;

  ShoppingCart({required this.id});

  int get length => _shoppingCart.length;

  getCartMap() {
    return _shoppingCart;
  }

  // getSize()  {
  //     _amount = FirebaseFirestore.instance.collection('carts').doc(id).collection('cartItems').count();
  //   // return
  // }

  getSum() {
    return _sum;
  }

  addProduct(Product product, int quantity) async {
    var ref = await FirebaseFirestore.instance.collection('carts')
        .doc(id)
        .collection('cartItems')
        .add({
      'productId': product.id,
      'title': product.getShortTitle(),
      'additionDate': DateTime.now(),
      'price': product.price,
      'imgUrl': product.imgUrl,
      'quantity': quantity,
    });

    ref.update({
      'id': ref.id,
    });

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

  static createShoppingCart(String uid) {
    return FirebaseFirestore.instance.collection('carts').add({'uid': uid});
    // return FirebaseFirestore.instance.collection('users').doc(uid).collection('carts').
  }

}