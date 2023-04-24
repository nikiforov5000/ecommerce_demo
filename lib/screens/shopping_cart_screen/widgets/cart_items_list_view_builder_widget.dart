import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/cart_item/card_widget.dart';
import 'package:flutter/material.dart';

class CartItemsListViewBuilderWidget extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;

  const CartItemsListViewBuilderWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (BuildContext context, int index) {
        var cartItem = ShoppingCartItem.fromFirestore(
            snapshot.data!.docs[index].data() as Map<String, dynamic>);
        return CardWidget(cartItem: cartItem);
      },
    );
  }
}

