import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartIcon extends StatefulWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    final cart = cartProvider.shoppingCart;
    String? text;


    return StreamBuilder<bool>(
      stream: cart!.isNotEmptyStream(),
      initialData: false,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          text = 'NotEmpty';
        }
        else {
          text = 'Empty';
        }
        return Text(text!, style: TextStyle(color: Colors.black),);
      }
    );
  }
}
