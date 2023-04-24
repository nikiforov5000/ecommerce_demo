import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/screens/shopping_cart_screen/widgets/cart_items_list_view_builder_widget.dart';
import 'package:flutter/material.dart';

class SnapshotStreamBuilderWidget extends StatelessWidget {
  final ShoppingCart shoppingCart;
  const SnapshotStreamBuilderWidget({super.key, required this.shoppingCart});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('carts')
          .doc(shoppingCart.id)
          .collection('cartItems')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const CircularProgressIndicator();
        }
        return CartItemsListViewBuilderWidget(
          snapshot: snapshot,
        );
      },
    );
  }
}
