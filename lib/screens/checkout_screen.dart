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
      body: Center(
        child: const Placeholder(

          child: Text('CheckoutScreen'),
        ),
      ),
    );
  }
}
