import 'package:ecommerce_demo/screens/order_summary/widgets/card_title.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/edit_title.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/line_text.dart';
import 'package:ecommerce_demo/screens/order_summary/widgets/pseudo_bank_card.dart';
import 'package:flutter/material.dart';

class PaymentDetailsCard extends StatelessWidget {
  const PaymentDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CardTitle('Payment'),
                GestureDetector(
                  onTap: () {},
                  child: const EditTitle(),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PseudoBankCard(),
                LineText('11/25'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
