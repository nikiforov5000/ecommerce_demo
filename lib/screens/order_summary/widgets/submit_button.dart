import 'package:ecommerce_demo/models/shopping_cart/shopping_cart.dart';
import 'package:ecommerce_demo/screens/order_success/order_success_screen.dart';
import 'package:ecommerce_demo/wrapper.dart';
import 'package:flutter/material.dart';


class SubmitButton extends StatelessWidget {
  final ShoppingCart _shoppingCart;
  const SubmitButton(this._shoppingCart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _shoppingCart.emptyCart();
        Navigator.popUntil(context, ModalRoute.withName(Wrapper.id));
        Navigator.pushNamed(context, OrderSuccessScreen.id);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text('Submit Order'),
      ),
    );
  }
}

