import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/shoppint_cart/shopping_cart_item.dart';


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

  getSum() {
    return _sum;
  }

  addProduct(Product product, int quantity) async {
    var cartItemsRef = await FirebaseFirestore.instance.collection('carts').doc(id).collection('cartItems');
    var query = cartItemsRef.where('productId', isEqualTo: product.id).limit(1);
    var snapshots = await query.get();

    if (snapshots.docs.isNotEmpty) {
      print('shopping_cart.dart -> addProduct() the product is there already, incrementing');
      cartItemsRef.doc(snapshots.docs.first.id).update(
          {'quantity': FieldValue.increment(quantity)});
    }
    else {
      var cartItemRef = await FirebaseFirestore.instance.collection('carts')
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

      cartItemRef.update({
        'id': cartItemRef.id,
      });
    }



    if (_shoppingCart.keys.contains(product)) {
      quantity += _shoppingCart[product]!;
    }
    _shoppingCart[product] = quantity;
    updateSum();
  }

  void updateQty({required ShoppingCartItem cartItem, required int qty}) async {
    final _firestore = FirebaseFirestore.instance;
    final _cartRef = _firestore.collection('carts').doc(id);
    final _cartItemRef = _cartRef.collection('cartItems').doc(cartItem.id);
    var data = { 'quantity': qty };
    _cartItemRef.update(data);
    // FirebaseFirestore.instance.collection('carts').doc(id).collection('cartItems').doc(cartItem.id).update();

    // if (qty == 0) {
    //   _shoppingCart.remove(product);
    // }
    // else {
    //   _shoppingCart[product] = qty;
    // }
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