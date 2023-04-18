import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCartItem {
  DateTime? additionDate;
  String? productId;
  double? price;
  int? quantity;
  String? imgUrl;

  ShoppingCartItem({
    this.imgUrl,
    this.productId,
    this.additionDate,
    this.quantity,
    this.price,
  });

  ShoppingCartItem.fromMap(Map<String, dynamic> data)
      : imgUrl = data['imgUrl'],
        productId = data['id'],
        additionDate = (data['additionDate'] as Timestamp).toDate(),
        quantity = data['quantity'],
        price = data['price'];

  factory ShoppingCartItem.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) { return ShoppingCartItem(); }
    return ShoppingCartItem(
      imgUrl: data['imgUrl'],
      productId: data['id'],
      additionDate: data['additionDate'],
      quantity: data['quantity'],
      price: data['price'],
    );
  }


  Map<String, dynamic> toFirestore() {
    return {
      if (imgUrl != null) 'imgUrl': imgUrl,
      if (productId != null) 'id': productId,
      if (additionDate != null) 'additionDate': additionDate,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
    };
  }

  void updateQuantity(String shoppingCartId, int value) {
    FirebaseFirestore.instance.collection('carts').doc(shoppingCartId).collection('cartItems').doc(productId);
  }
}
