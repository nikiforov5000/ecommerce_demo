import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCartItem {
  String id;
  DateTime? additionDate;
  String? productId;
  double? price;
  int? quantity;
  String? imgUrl;
  String? title;

  ShoppingCartItem({
    required this.id,
    this.quantity,
    this.imgUrl,
    this.price,
    this.additionDate,
    this.title,
    this.productId,
  });

  // ShoppingCartItem.fromMap(Map<String, dynamic> data)
  //     : imgUrl = data['imgUrl'],
  //       productId = data['id'],
  //       additionDate = (data['additionDate'] as Timestamp).toDate(),
  //       quantity = data['quantity'],
  //       price = data['price'];

  factory ShoppingCartItem.fromFirestore(Map<String, dynamic> data) {
    // if (data == null) { return ShoppingCartItem(id: null); }
    return ShoppingCartItem(
      id: data['id'],
      productId: data['productId'],
      title: data['title'],
      additionDate: (data['additionDate'] as Timestamp).toDate(),
      price: data['price'].toDouble(),
      imgUrl: data['imgUrl'],
      quantity: data['quantity'],
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
