import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final shoppingCart = shoppingCartProvider.shoppingCart;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total price: '),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('carts')
                .doc(shoppingCart?.id)
                .collection('cartItems').snapshots(),
            builder: (BuildContext context, snapshot) {
              double total = 0.0;
              for (var element in snapshot.data!.docs) {
                double price = element.data()['price'];
                int quantity = element.data()['quantity'];
                total += (price * quantity);
              }
              shoppingCart?.sum = total;
              return Text('\$${total.toStringAsFixed(2)}');
            }
        ),
      ],
    );
  }
}