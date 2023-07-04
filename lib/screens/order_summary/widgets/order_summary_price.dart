import 'package:ecommerce_demo/screens/order_success/constants.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/card_title.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/line_text.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/line_title.dart';
import 'package:ecommerce_demo/services/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSummaryPrice extends StatelessWidget {
  const OrderSummaryPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final shoppingCart = shoppingCartProvider.shoppingCart;
    final totalSum = shoppingCart!.getSum();
    return Card(
      color: kCardLightBackgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardTitle('Order Summary'),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LineTitle('Subtotal'),
                    LineText('\$${(totalSum * 0.9).toStringAsFixed(2)}'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LineTitle('Delivery'),
                    LineText('\$${(totalSum * 0.1).toStringAsFixed(2)}'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CardTitle('Total'),
                    CardTitle('\$$totalSum'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}