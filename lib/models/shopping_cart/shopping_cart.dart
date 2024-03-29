import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/product.dart';
import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingCart {
  final Map<Product, int> _shoppingCart = {};
  double _sum = 0;
  int _amount = 0;
  final String id;

  ShoppingCart({required this.id});

  int get length => _shoppingCart.length;

  set sum(double sum) { _sum = sum; }



  getCartMap() {
    return _shoppingCart;
  }

  getSum() {
    return _sum;
  }

  addProduct(Product product, int quantity) async {
    var cartItemsRef = FirebaseFirestore.instance
        .collection('carts')
        .doc(id)
        .collection('cartItems');
    var query = cartItemsRef.where('productId', isEqualTo: product.id).limit(1);
    var snapshots = await query.get();

    if (snapshots.docs.isNotEmpty) {
      cartItemsRef
          .doc(snapshots.docs.first.id)
          .update({'quantity': FieldValue.increment(quantity)});
    } else {
      var cartItemRef = await FirebaseFirestore.instance
          .collection('carts')
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
    _sum += (product.price * quantity);
  }

  void emptyCart() {
    print('shopping_cart.dart -> emptyCart()');
    final firestore = FirebaseFirestore.instance;
    final cartItemsSnapshot = firestore.collection('carts').doc(id).collection('cartItems').snapshots();

    cartItemsSnapshot.first.then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  void updateQty({required ShoppingCartItem cartItem, required int qty}) async {
    final firestore = FirebaseFirestore.instance;
    final cartRef = firestore.collection('carts').doc(id);
    final cartItemRef = cartRef.collection('cartItems').doc(cartItem.id);
    var data = {'quantity': qty};
    cartItemRef.update(data);
    fetchTotal();
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
    var cartRef = FirebaseFirestore.instance.collection('carts').add({'uid': uid});
    return cartRef.then((value) => value.id);
  }

  void removeCartItem(ShoppingCartItem cartItem) {
    final cartRef = FirebaseFirestore.instance.collection('carts').doc(id);
    cartRef.collection('cartItems').doc(cartItem.id).delete();


  }

  setItemsAmount() {
    final cartRef = FirebaseFirestore.instance.collection('carts').doc(id).collection('cartItems').get();
    cartRef.then((value) {
      final length = value.docs.length;
      _amount = length;
    });
  }

  Stream<int> isNotEmptyStream() {
    final cartRef = FirebaseFirestore.instance.collection('carts').doc(id).collection('cartItems').snapshots();
    return cartRef.map((event) => event.docs.length).debounceTime(const Duration(seconds: 1));
  }

  void fetchTotal() async {
    _sum = 0;
    _amount = 0;
    final itemsRef = FirebaseFirestore.instance
        .collection('carts')
        .doc(id)
        .collection('cartItems');
    print('shopping_cart.dart -> fetchTotal() -> itemsRef.snapshots().first.toString()');
    await itemsRef.snapshots().first.then(
        (value) {
          print('value:' + value.toString());
          value.docs.forEach((element) {
            double price = element.data()['price'];
            int quantity = element.data()['quantity'];
            _amount += quantity;
            _sum += (price * quantity);
          });
        });
    // _sum = await itemsRef.snapshots().first.then((value) {
    //   value.docs.map((e) => e.data()['price'];
    // }
    // );
  }

  Future<bool> isProductInCart(Product product) async {
    final cartItemsRef = FirebaseFirestore.instance.collection('carts').doc(id).collection('cartItems');
    QuerySnapshot querySnapshot = await cartItemsRef.where('productId', isEqualTo: product.id).get();
    return querySnapshot.docs.length > 0;
  }
}
