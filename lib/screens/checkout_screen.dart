import 'package:ecommerce_demo/constants/colors.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  static const String id = 'checkout_screen';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Container(
        color: kBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: const Placeholder(

            child: Text('CheckoutScreen'),
          ),
        ),
      ),
    );
  }
}
